#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "stagehand"

require_relative "env"
ExampleEnv.load!
model_key = ENV["MODEL_API_KEY"].to_s
if model_key.empty?
  warn "Set MODEL_API_KEY to run the local example."
  exit 1
end

client = Stagehand::Client.new(
  model_api_key: model_key,
  server: "local"
)

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

  observe_stream = client.sessions.observe_streaming(
    session_id,
    instruction: "Find all clickable links on this page"
  )
  observe_result = stream_with_result("Observe", observe_stream)
  observe_actions = observe_result || []
  puts("Found #{observe_actions.length} possible actions")

  action = observe_actions.first
  act_input = action ? action.to_h.merge(method: "click") : "Click the 'Learn more' link"
  act_stream = client.sessions.act_streaming(
    session_id,
    input: act_input
  )
  act_result = stream_with_result("Act", act_stream)
  act_message = act_result.is_a?(Hash) ? (act_result[:message] || act_result["message"]) : act_result
  puts("Act completed: #{act_message}")

  extract_stream = client.sessions.extract_streaming(
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
  extract_result = stream_with_result("Extract", extract_stream)
  puts("Extracted: #{extract_result}")

  execute_stream = client.sessions.execute_streaming(
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
  execute_result = stream_with_result("Execute", execute_stream)
  execute_message = execute_result.is_a?(Hash) ? (execute_result[:message] || execute_result["message"]) : execute_result
  execute_success = execute_result.is_a?(Hash) ? (execute_result[:success] || execute_result["success"]) : nil
  execute_actions = execute_result.is_a?(Hash) ? (execute_result[:actions] || execute_result["actions"]) : nil
  puts("Agent completed: #{execute_message}")
  puts("Agent success: #{execute_success}")
  puts("Agent actions taken: #{execute_actions&.length || 0}")
ensure
  client.sessions.end_(session_id) if session_id
  client.close
end
