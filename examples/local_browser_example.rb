#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "stagehand"

# Local mode runs the embedded Stagehand server and uses a local Chrome/Chromium.
# Set MODEL_API_KEY before running this script.
model_key = ENV["MODEL_API_KEY"].to_s
if model_key.empty?
  warn "Set MODEL_API_KEY to run the local example."
  exit 1
end

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
        headless: false
      }
    }
  )
  session_id = start_response.data.session_id
  puts("Session started: #{session_id}")

  client.sessions.navigate(session_id, url: "https://example.com")
  puts("Navigated to example.com")

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
    instruction: "extract the main heading and any links on this page",
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
      instruction: "Click on the 'Learn more' link if available and report the page title",
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
ensure
  client.sessions.end_(session_id) if session_id
  client.close
end
