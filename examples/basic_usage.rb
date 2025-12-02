#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/stagehand"

# Basic example demonstrating Stagehand Ruby SDK usage

# Create a client
client = Stagehand::Client.new(
  api_key: ENV["STAGEHAND_API_KEY"],
  environment: :production
)

begin
  # Start a local browser session (session_id stored automatically)
  puts "Starting session..."
  client.session.start(
    env: :LOCAL,
    verbose: 1,
    local_browser_launch_options: {
      headless: false
    }
  )
  puts "Session started: #{client.session.session_id}"

  # Navigate to a website
  puts "\nNavigating to example.com..."
  client.session.navigate(url: "https://example.com")
  puts "Navigation complete"

  # Extract data from the page
  puts "\nExtracting page content..."
  extraction = client.session.extract(
    instruction: "Extract the main heading and first paragraph"
  )
  puts "Extracted: #{extraction.extraction}"

  # Observe available actions
  puts "\nObserving available actions..."
  observations = client.session.observe
  puts "Found #{observations.size} actions:"
  observations.each do |action|
    puts "  - #{action.method}: #{action.description}"
  end

  # Perform an action
  puts "\nPerforming action..."
  result = client.session.act(input: "click the 'More information' link")
  puts "Action result: #{result.success ? 'Success' : 'Failed'}"
  puts "Message: #{result.message}"

ensure
  # Always end the session
  if client.session.active?
    puts "\nEnding session..."
    client.session.end_
    puts "Session ended"
  end
end
