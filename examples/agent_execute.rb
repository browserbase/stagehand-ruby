#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/stagehand"

# Example demonstrating autonomous agent execution

client = Stagehand::Client.new(api_key: ENV["STAGEHAND_API_KEY"])

begin
  # Start session
  session = client.sessions.start(env: :LOCAL, verbose: 1)
  session_id = session.session_id
  puts "Session started: #{session_id}"

  # Navigate to a shopping site
  client.sessions.navigate(session_id, url: "https://www.example-shop.com")

  # Execute an autonomous agent
  puts "\nExecuting agent..."
  result = client.sessions.execute_agent(
    session_id,
    execute_options: {
      instruction: "Search for 'wireless headphones', find the cheapest option, and add it to cart",
      max_steps: 15,
      highlight_cursor: true
    },
    agent_config: {
      model: "openai/gpt-4o",
      provider: :openai
    },
    stream: true
  ) do |event|
    case event[:type]
    when "progress"
      puts "[STEP] #{event[:message]}"
    when "action"
      puts "[ACTION] #{event[:action]}"
    end
  end

  puts "\nAgent completed!"
  puts "Final message: #{result.message}"
  puts "Steps taken: #{result.steps.length}"

ensure
  client.sessions.end_(session_id) if session_id
end
