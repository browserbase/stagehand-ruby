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
  # Start a local browser session
  puts "Starting session..."
  session = client.sessions.start(
    env: :LOCAL,
    verbose: 1,
    local_browser_launch_options: {
      headless: false
    }
  )
  session_id = session.session_id
  puts "Session started: #{session_id}"

  # Navigate to a website
  puts "\nNavigating to example.com..."
  client.sessions.navigate(session_id, url: "https://example.com")
  puts "Navigation complete"

  # Extract data from the page
  puts "\nExtracting page content..."
  extraction = client.sessions.extract(
    session_id,
    instruction: "Extract the main heading and first paragraph"
  )
  puts "Extracted: #{extraction.extraction}"

  # Observe available actions
  puts "\nObserving available actions..."
  observations = client.sessions.observe(session_id)
  puts "Found #{observations.size} actions:"
  observations.each do |action|
    puts "  - #{action.method}: #{action.description}"
  end

  # Perform an action
  puts "\nPerforming action..."
  result = client.sessions.act(session_id, input: "click the 'More information' link")
  puts "Action result: #{result.success ? 'Success' : 'Failed'}"
  puts "Message: #{result.message}"

ensure
  # Always end the session
  if session_id
    puts "\nEnding session..."
    client.sessions.end_(session_id)
    puts "Session ended"
  end
end
