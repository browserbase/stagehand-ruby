#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "stagehand"

# Remote browser example using Browserbase + Stagehand.
# Requires BROWSERBASE_API_KEY, BROWSERBASE_PROJECT_ID, and MODEL_API_KEY.

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

session_id = nil

begin
  start_response = client.sessions.start(
    model_name: "openai/gpt-5-nano"
  )
  session_id = start_response.data.session_id
  puts("Session started: #{session_id}")

  client.sessions.navigate(session_id, url: "https://news.ycombinator.com")
  puts("Navigated to Hacker News")

  observe_response = client.sessions.observe(
    session_id,
    instruction: "find the link to view comments for the top post"
  )

  actions = observe_response.data.result
  puts("Found #{actions.length} possible actions")

  action = actions.first
  unless action
    warn("No actions found")
    exit(1)
  end

  puts("Acting on: #{action.description}")

  act_response = client.sessions.act(
    session_id,
    input: action.to_h.merge(method: "click")
  )
  puts("Act completed: #{act_response.data.result[:message]}")

  extract_response = client.sessions.extract(
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
  puts("Extracted data: #{extract_response.data.result}")

  extracted_data = extract_response.data.result
  author = extracted_data.is_a?(Hash) ? extracted_data[:author] : nil
  author ||= "unknown"
  puts("Looking up profile for author: #{author}")

  instruction = [
    "Find any personal website, GitHub, or LinkedIn for the Hacker News user '#{author}'.",
    "Click their username to open the profile and look for shared links."
  ].join(" ")

  execute_response = client.sessions.execute(
    session_id,
    execute_options: {
      instruction: instruction,
      max_steps: 15
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
  puts("Agent actions taken: #{execute_response.data.result[:actions]&.length || 0}")
ensure
  client.sessions.end_(session_id) if session_id
  client.close
end
