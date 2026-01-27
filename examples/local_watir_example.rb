#!/usr/bin/env ruby
# typed: ignore
# frozen_string_literal: true

require "bundler/setup"
require "json"
require "net/http"
require "stagehand"

# Example: Using Watir with Stagehand local mode
#
# This example demonstrates how to combine Watir (for low-level browser control)
# with Stagehand (for AI-powered actions) using a local browser.
#
# Prerequisites:
#   - Set MODEL_API_KEY or OPENAI_API_KEY environment variable
#   - Chrome/Chromium installed locally
#   - Install Watir (outside this gem):
#       gem install watir
#
# Run:
#   bundle exec ruby examples/local_watir_example.rb

begin
  require("watir")
rescue LoadError
  warn("Watir is not installed. Run: gem install watir")
  exit(1)
end

DEBUG_PORT = 9222

def fetch_cdp_websocket_url(port)
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

model_key = ENV["MODEL_API_KEY"] || ENV["OPENAI_API_KEY"]
if model_key.to_s.empty?
  warn "Set MODEL_API_KEY (or OPENAI_API_KEY) to run the local example."
  exit 1
end

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument("--remote-debugging-port=#{DEBUG_PORT}")
options.add_argument("--disable-gpu")

browser = Watir::Browser.new(:chrome, options: options)

client = Stagehand::Client.new(
  model_api_key: model_key,
  server: "local"
)

session_id = nil
begin
  browser.goto("https://example.com")

  ws_url = fetch_cdp_websocket_url(DEBUG_PORT)
  puts("Browser WebSocket URL: #{ws_url}")

  start_response = client.sessions.start(
    model_name: "openai/gpt-5-nano",
    browser: {
      type: :local,
      launch_options: {
        cdp_url: ws_url
      }
    }
  )
  session_id = start_response.data.session_id
  puts("Session started: #{session_id}")

  client.sessions.navigate(session_id, url: "https://example.com")

  observe_response = client.sessions.observe(
    session_id,
    instruction: "Find all clickable links on this page"
  )
  puts("Found #{observe_response.data.result.length} possible actions")

  action = observe_response.data.result.first
  act_input = action ? action.to_h.merge(method: "click") : "Click the 'Learn more' link"
  act_response = client.sessions.act(
    session_id,
    input: act_input
  )
  puts("Act completed: #{act_response.data.result[:message]}")

  extract_response = client.sessions.extract(
    session_id,
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

  browser.screenshot.save("screenshot_local_watir.png")
  puts("Screenshot saved to: screenshot_local_watir.png")
ensure
  client.sessions.end_(session_id) if session_id
  client.close
  browser.close
end
