#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/stagehand"

# Example demonstrating autonomous agent execution

client = Stagehand::Client.new(api_key: ENV["STAGEHAND_API_KEY"])

begin
  # Start session
  client.session.start(env: :LOCAL, verbose: 1)
  puts "Session started: #{client.session.session_id}"

  # Navigate to a shopping site
  client.session.navigate(url: "https://www.example-shop.com")

  # Execute an autonomous agent
  puts "\nExecuting agent..."
  result = client.session.execute_agent(
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
  client.session.end_ if client.session.active?
end
