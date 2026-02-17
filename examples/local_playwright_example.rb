#!/usr/bin/env ruby
# typed: ignore
# frozen_string_literal: true

require "bundler/setup"
require "json"
require "net/http"
require "stagehand"

require_relative "env"
ExampleEnv.load!
begin
  require("playwright")
rescue LoadError
  warn("Playwright is not installed. Run: gem install playwright-ruby-client")
  exit(1)
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

def print_stream_event(label, event)
  case event.type
  when :log
    puts("[#{label}] log: #{event.data.message}")
  when :system
    status = event.data.status
    if event.data.respond_to?(:error) && event.data.error
      puts("[#{label}] system #{status}: #{event.data.error}")
    elsif event.data.respond_to?(:result) && !event.data.result.nil?
      puts("[#{label}] system #{status}: #{event.data.result}")
    else
      puts("[#{label}] system #{status}")
    end
  else
    puts("[#{label}] event: #{event.inspect}")
  end
end

def stream_with_result(label, stream)
  puts("#{label} stream:")
  result = nil
  stream.each do |event|
    print_stream_event(label, event)
    if event.type == :system && event.data.respond_to?(:result) && !event.data.result.nil?
      result = event.data.result
    end
    if event.type == :system && event.data.respond_to?(:status) && event.data.status == :error
      error_message = event.data.respond_to?(:error) && event.data.error ? event.data.error : "unknown error"
      raise("#{label} stream error: #{error_message}")
    end
  end
  result
end

model_key = ENV["MODEL_API_KEY"]
if model_key.to_s.empty?
  warn "Set MODEL_API_KEY to run the local example."
  exit 1
end

# rubocop:disable Metrics/BlockLength
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
      model_name: "anthropic/claude-sonnet-4-6",
      browser: {
        type: :local,
        launch_options: {
          cdp_url: browser_ws_url
        }
      }
    )
    session_id = start_response.data.session_id
    puts("Session started: #{session_id}")

    observe_stream = client.sessions.observe_streaming(
      session_id,
      frame_id: page_target_id,
      instruction: "Find all clickable links on this page"
    )
    observe_result = stream_with_result("Observe", observe_stream)
    observe_actions = observe_result || []
    puts("Found #{observe_actions.length} possible actions")

    action = observe_actions.first
    act_input = action ? action.to_h.merge(method: "click") : "Click the 'Learn more' link"
    act_stream = client.sessions.act_streaming(
      session_id,
      frame_id: page_target_id,
      input: act_input
    )
    act_result = stream_with_result("Act", act_stream)
    act_message = act_result.is_a?(Hash) ? (act_result[:message] || act_result["message"]) : act_result
    puts("Act completed: #{act_message}")

    extract_stream = client.sessions.extract_streaming(
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
    extract_result = stream_with_result("Extract", extract_stream)
    puts("Extracted: #{extract_result}")

    execute_stream = client.sessions.execute_streaming(
      session_id,
      frame_id: page_target_id,
      execute_options: {
        instruction: "Click on the 'Learn more' link if available",
        max_steps: 3
      },
      agent_config: {
        model: Stagehand::ModelConfig.new(
          model_name: "anthropic/claude-sonnet-4-6",
          api_key: model_key
        ),
        cua: false
      }
    )
    execute_result = stream_with_result("Execute", execute_stream)
    execute_message = execute_result.is_a?(Hash) ? (execute_result[:message] || execute_result["message"]) : execute_result
    execute_success = execute_result.is_a?(Hash) ? (execute_result[:success] || execute_result["success"]) : nil
    execute_actions = execute_result.is_a?(Hash) ? (execute_result[:actions] || execute_result["actions"]) : nil
    puts("Agent completed: #{execute_message}")
    puts("Agent success: #{execute_success}")
    puts("Agent actions taken: #{execute_actions&.length || 0}")

    page.wait_for_load_state(state: "domcontentloaded")
    page.screenshot(path: "screenshot_local_playwright.png", fullPage: true)
    puts("Screenshot saved to: screenshot_local_playwright.png")
  ensure
    client.sessions.end_(session_id) if session_id
    client.close
    browser.close
  end
end
# rubocop:enable Metrics/BlockLength
