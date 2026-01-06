#!/usr/bin/env ruby
# frozen_string_literal: true

require "bundler/setup"
require "stagehand"

# Set these environment variables before running this script:
#   BROWSERBASE_API_KEY     - Your Browserbase API key
#   BROWSERBASE_PROJECT_ID  - Your Browserbase project ID
#   MODEL_API_KEY           - Your AI model API key (e.g., OpenAI)

# Create a new Stagehand client with your credentials
client = Stagehand::Client.new(
  browserbase_api_key: ENV["BROWSERBASE_API_KEY"],
  browserbase_project_id: ENV["BROWSERBASE_PROJECT_ID"],
  model_api_key: ENV["MODEL_API_KEY"]
)

# Start a new browser session
# x_language and x_sdk_version headers are required for the v3 API
start_response = client.sessions.start(
  model_name: "openai/gpt-5-nano",
  x_language: :typescript,
  x_sdk_version: "3.0.6"
)
puts "Session started: #{start_response.data.session_id}"

session_id = start_response.data.session_id

# Navigate to a webpage
# frame_id is required - use empty string for the main frame
client.sessions.navigate(
  session_id,
  url: "https://news.ycombinator.com",
  frame_id: "",
  x_language: :typescript,
  x_sdk_version: "3.0.6"
)
puts "Navigated to Hacker News"

# Use Observe to find possible actions on the page
observe_response = client.sessions.observe(
  session_id,
  instruction: "find the link to view comments for the top post",
  x_language: :typescript,
  x_sdk_version: "3.0.6"
)

actions = observe_response.data.result
puts "Found #{actions.length} possible actions"

if actions.empty?
  puts "No actions found"
  exit 1
end

# Take the first action returned by Observe
action = actions.first
puts "Acting on: #{action.description}"

# Pass the structured action to Act
# Convert the observe result to a hash and ensure method is set to "click"
act_response = client.sessions.act(
  session_id,
  input: action.to_h.merge(method: "click"),
  x_language: :typescript,
  x_sdk_version: "3.0.6"
)
puts "Act completed: #{act_response.data.result[:message]}"

# Extract data from the page
# We're now on the comments page, so extract the top comment text
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
  },
  x_language: :typescript,
  x_sdk_version: "3.0.6"
)
puts "Extracted data: #{extract_response.data.result}"

# Get the author from the extracted data
extracted_data = extract_response.data.result
author = extracted_data[:author]
puts "Looking up profile for author: #{author}"

# Use the Agent to find the author's profile
# Execute runs an autonomous agent that can navigate and interact with pages
execute_response = client.sessions.execute(
  session_id,
  execute_options: {
    instruction: "Find any personal website, GitHub, LinkedIn, or other best profile URL for the Hacker News user '#{author}'. " \
                 "Click on their username to go to their profile page and look for any links they have shared.",
    max_steps: 15
  },
  agent_config: {
    model: Stagehand::ModelConfig::ModelConfigObject.new(
      model_name: "openai/gpt-5-nano",
      api_key: ENV["MODEL_API_KEY"]
    ),
    cua: false
  },
  x_language: :typescript,
  x_sdk_version: "3.0.6"
)
puts "Agent completed: #{execute_response.data.result[:message]}"
puts "Agent success: #{execute_response.data.result[:success]}"
puts "Agent actions taken: #{execute_response.data.result[:actions]&.length || 0}"

# End the session to cleanup browser resources
client.sessions.end_(
  session_id,
  x_language: :typescript,
  x_sdk_version: "3.0.6"
)
puts "Session ended"
