#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "json"
require "net/http"
require "stagehand"

# Example: Using Playwright with Stagehand local mode
#
# This example mirrors the Python Playwright flow: launch the browser with Playwright,
# connect Stagehand to the same browser via CDP, and target the existing page by frame_id.
#
# Prerequisites:
#   - Set MODEL_API_KEY or OPENAI_API_KEY environment variable
#   - Chrome/Chromium installed locally
#   - Install Playwright (outside this gem):
#       gem install playwright-ruby-client
#       npm install playwright
#       ./node_modules/.bin/playwright install chromium
#
# Run:
#   bundle exec ruby examples/playwright_local_example.rb

begin
  require "playwright"
rescue LoadError
  warn "Playwright is not installed. Run: gem install playwright-ruby-client"
  exit 1
end

DEBUG_PORT = 9222

def fetch_browser_cdp_websocket_url(port)
  uri = URI("http://127.0.0.1:#{port}/json/version")
  response = Net::HTTP.get_response(uri)
  unless response.is_a?(Net::HTTPSuccess)
    raise "Failed to fetch /json/version: #{response.code} #{response.message}"
  end

  payload = JSON.parse(response.body)
  ws_url = payload["webSocketDebuggerUrl"]
  raise "webSocketDebuggerUrl not found in response" if ws_url.to_s.empty?

  ws_url
end

def fetch_page_target_id(port, page_url)
  uri = URI("http://127.0.0.1:#{port}/json/list")
  response = Net::HTTP.get_response(uri)
  unless response.is_a?(Net::HTTPSuccess)
    raise "Failed to fetch /json/list: #{response.code} #{response.message}"
  end

  targets = JSON.parse(response.body)
  normalized_page_url = page_url.to_s.sub(%r{/$}, "")
  target =
    targets.find do |entry|
      next false unless entry.is_a?(Hash) && entry["type"] == "page"

      entry_url = entry["url"].to_s.sub(%r{/$}, "")
      entry_url == normalized_page_url
    end
  target ||= targets.find { |entry| entry.is_a?(Hash) && entry["type"] == "page" }
  target_id = target && target["id"]
  raise "Page target id not found for page target" if target_id.to_s.empty?

  target_id
end

model_key = ENV["MODEL_API_KEY"] || ENV["OPENAI_API_KEY"]
if model_key.to_s.empty?
  warn "Set MODEL_API_KEY (or OPENAI_API_KEY) to run the local example."
  exit 1
end

Playwright.create(playwright_cli_executable_path: "./node_modules/.bin/playwright") do |playwright|
  browser = playwright.chromium.launch(
    headless: false,
    args: ["--remote-debugging-port=#{DEBUG_PORT}"]
  )

  page = browser.new_page
  page.goto("https://example.com")
  page.wait_for_load_state(state: "domcontentloaded")

  browser_ws_url = fetch_browser_cdp_websocket_url(DEBUG_PORT)
  page_target_id = fetch_page_target_id(DEBUG_PORT, page.url)
  puts "Browser WebSocket URL: #{browser_ws_url}"
  puts "Page target id: #{page_target_id}"

  client = Stagehand::Client.new(
    model_api_key: model_key,
    server: "local"
  )

  session_id = nil
  begin
    start_response = client.sessions.start(
      model_name: "openai/gpt-5-nano",
      browser: {
        type: :local,
        launch_options: {
          cdp_url: browser_ws_url
        }
      }
    )
    session_id = start_response.data.session_id
    puts "Session started: #{session_id}"

    observe_response = client.sessions.observe(
      session_id,
      frame_id: page_target_id,
      instruction: "Find all clickable links on this page"
    )
    puts "Found #{observe_response.data.result.length} possible actions"

    action = observe_response.data.result.first
    act_input = action ? action.to_h.merge(method: "click") : "Click the 'Learn more' link"
    act_response = client.sessions.act(
      session_id,
      frame_id: page_target_id,
      input: act_input
    )
    puts "Act completed: #{act_response.data.result[:message]}"

    extract_response = client.sessions.extract(
      session_id,
      frame_id: page_target_id,
      instruction: "Extract the main heading and any links on this page",
      schema: {
        type: "object",
        properties: {
          heading: { type: "string" },
          links: { type: "array", items: { type: "string" } }
        }
      }
    )
    puts "Extracted: #{extract_response.data.result}"

    execute_response = client.sessions.execute(
      session_id,
      frame_id: page_target_id,
      execute_options: {
        instruction: "Click on the 'Learn more' link if available",
        max_steps: 3
      },
      agent_config: {
        model: Stagehand::ModelConfig::ModelConfigObject.new(
          model_name: "openai/gpt-5-nano",
          api_key: model_key
        ),
        cua: false
      }
    )
    puts "Agent completed: #{execute_response.data.result[:message]}"
    puts "Agent success: #{execute_response.data.result[:success]}"

    page.wait_for_load_state(state: "domcontentloaded")
    page.screenshot(path: "screenshot_local_playwright.png", fullPage: true)
    puts "Screenshot saved to: screenshot_local_playwright.png"
  ensure
    client.sessions.end_(session_id) if session_id
    client.close
    browser.close
  end
end
