#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "stagehand"

require_relative "env"
ExampleEnv.load!
browserbase_api_key = ENV["BROWSERBASE_API_KEY"].to_s
browserbase_project_id = ENV["BROWSERBASE_PROJECT_ID"].to_s
model_key = ENV["MODEL_API_KEY"].to_s

missing = []
missing << "BROWSERBASE_API_KEY" if browserbase_api_key.empty?
missing << "BROWSERBASE_PROJECT_ID" if browserbase_project_id.empty?
missing << "MODEL_API_KEY" if model_key.empty?

unless missing.empty?
  warn "Set #{missing.join(', ')} to run the remote browser example."
  exit 1
end

client = Stagehand::Client.new(
  browserbase_api_key: browserbase_api_key,
  browserbase_project_id: browserbase_project_id,
  model_api_key: model_key
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
    model_name: "anthropic/claude-sonnet-4-6"
  )
  session_id = start_response.data.session_id
  puts("Session started: #{session_id}")

  client.sessions.navigate(session_id, url: "https://news.ycombinator.com")
  puts("Navigated to Hacker News")

  observe_stream = client.sessions.observe_streaming(
    session_id,
    instruction: "find the link to view comments for the top post"
  )

  observe_result = stream_with_result("Observe", observe_stream)
  actions = observe_result || []
  puts("Found #{actions.length} possible actions")

  action = actions.first
  unless action
    warn("No actions found")
    exit(1)
  end

  puts("Acting on: #{action.description}")

  act_stream = client.sessions.act_streaming(
    session_id,
    input: action.to_h.merge(method: "click")
  )
  act_result = stream_with_result("Act", act_stream)
  act_message = act_result.is_a?(Hash) ? (act_result[:message] || act_result["message"]) : act_result
  puts("Act completed: #{act_message}")

  extract_stream = client.sessions.extract_streaming(
    session_id,
    instruction: "extract the text of the top comment on this page",
    schema: {
      type: "object",
      properties: {
        comment_text: {
          type: "string",
          description: "The text content of the top comment"
        },
        author: {
          type: "string",
          description: "The username of the comment author"
        }
      },
      required: ["comment_text"]
    }
  )
  extract_result = stream_with_result("Extract", extract_stream)
  puts("Extracted data: #{extract_result}")

  extracted_data = extract_result
  author = extracted_data.is_a?(Hash) ? extracted_data[:author] : nil
  author ||= "unknown"
  puts("Looking up profile for author: #{author}")

  instruction = [
    "Find any personal website, GitHub, or LinkedIn for the Hacker News user '#{author}'.",
    "Click their username to open the profile and look for shared links."
  ].join(" ")

  execute_stream = client.sessions.execute_streaming(
    session_id,
    execute_options: {
      instruction: instruction,
      max_steps: 15
    },
    agent_config: {
      model: Stagehand::ModelConfig.new(
        model_name: "anthropic/claude-opus-4-6",
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
