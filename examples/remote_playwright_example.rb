#!/usr/bin/env ruby
# typed: ignore
# frozen_string_literal: true

require "bundler/setup"
require "stagehand"

# Example: Using Playwright with Stagehand remote mode (Browserbase browser).
#
# Prerequisites:
#   - Set MODEL_API_KEY or OPENAI_API_KEY environment variable
#   - Set BROWSERBASE_API_KEY and BROWSERBASE_PROJECT_ID
#   - Install Playwright (outside this gem):
#       gem install playwright-ruby-client
#       npm install playwright
#       ./node_modules/.bin/playwright install chromium
#
# Run:
#   bundle exec ruby examples/remote_playwright_example.rb

begin
  require("playwright")
rescue LoadError
  warn("Playwright is not installed. Run: gem install playwright-ruby-client")
  exit(1)
end

model_key = ENV["MODEL_API_KEY"] || ENV["OPENAI_API_KEY"]
browserbase_api_key = ENV["BROWSERBASE_API_KEY"].to_s
browserbase_project_id = ENV["BROWSERBASE_PROJECT_ID"].to_s

missing = []
missing << "MODEL_API_KEY" if model_key.to_s.empty?
missing << "BROWSERBASE_API_KEY" if browserbase_api_key.empty?
missing << "BROWSERBASE_PROJECT_ID" if browserbase_project_id.empty?

unless missing.empty?
  warn("Set #{missing.join(', ')} to run the remote Playwright example.")
  exit(1)
end

def normalize_url(url)
  url.to_s.sub(%r{/$}, "")
end

def resolve_page_target_id(cdp_session, page_url)
  info = cdp_session.send("Target.getTargetInfo")
  target_id = info.dig("targetInfo", "targetId")
  return target_id unless target_id.to_s.empty?

  targets = cdp_session.send("Target.getTargets")
  entries = targets["targetInfos"] || []
  normalized = normalize_url(page_url)

  target =
    entries.find do |entry|
      next false unless entry.is_a?(Hash) && entry["type"] == "page"

      normalize_url(entry["url"]) == normalized
    end
  target ||= entries.find { |entry| entry.is_a?(Hash) && entry["type"] == "page" }
  target && target["targetId"]
end

client = Stagehand::Client.new(
  browserbase_api_key: browserbase_api_key,
  browserbase_project_id: browserbase_project_id,
  model_api_key: model_key,
  server: "remote"
)

session_id = nil

begin
  start_response = client.sessions.start(
    model_name: "openai/gpt-5-nano",
    browser: {
      type: :browserbase
    }
  )
  session_id = start_response.data.session_id
  cdp_url = start_response.data.cdp_url
  if cdp_url.to_s.empty?
    raise "No CDP URL returned for this session."
  end

  puts("Session started: #{session_id}")
  puts("Connecting Playwright over CDP...")

  # rubocop:disable Metrics/BlockLength
  Playwright.create(playwright_cli_executable_path: "./node_modules/.bin/playwright") do |playwright|
    browser = playwright.chromium.connect_over_cdp(cdp_url)
    begin
      context = browser.contexts.first || browser.new_context
      page = context.pages.first || context.new_page
      page.goto("https://example.com", wait_until: "domcontentloaded")

      cdp_session = context.new_cdp_session(page)
      page_target_id = resolve_page_target_id(cdp_session, page.url)
      if page_target_id.to_s.empty?
        raise "Page target id not found for page target"
      end

      observe_response = client.sessions.observe(
        session_id,
        frame_id: page_target_id,
        instruction: "Find all clickable links on this page"
      )
      puts("Found #{observe_response.data.result.length} possible actions")

      action = observe_response.data.result.first
      act_input = action ? action.to_h.merge(method: "click") : "Click the 'Learn more' link"
      act_response = client.sessions.act(
        session_id,
        frame_id: page_target_id,
        input: act_input
      )
      puts("Act completed: #{act_response.data.result[:message]}")

      extract_response = client.sessions.extract(
        session_id,
        frame_id: page_target_id,
        instruction: "Extract the main heading and any links on this page",
        schema: {
          type: "object",
          properties: {
            heading: {type: "string"},
            links: {type: "array", items: {type: "string"}}
          }
        }
      )
      puts("Extracted: #{extract_response.data.result}")

      execute_response = client.sessions.execute(
        session_id,
        frame_id: page_target_id,
        execute_options: {
          instruction: "Click on the 'Learn more' link if available",
          max_steps: 3
        },
        agent_config: {
          model: Stagehand::ModelConfig.new(
            model_name: "openai/gpt-5-nano",
            api_key: model_key
          ),
          cua: false
        }
      )
      puts("Agent completed: #{execute_response.data.result[:message]}")
      puts("Agent success: #{execute_response.data.result[:success]}")

      page.wait_for_load_state(state: "domcontentloaded")
      page.screenshot(path: "screenshot_remote_playwright.png", fullPage: true)
      puts("Screenshot saved to: screenshot_remote_playwright.png")
    ensure
      browser.close
    end
  end
  # rubocop:enable Metrics/BlockLength
ensure
  client.sessions.end_(session_id) if session_id
  client.close
end
