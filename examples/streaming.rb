#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/stagehand"

# Example demonstrating streaming responses

client = Stagehand::Client.new(api_key: ENV["STAGEHAND_API_KEY"])

begin
  # Start session with streaming logs
  puts "Starting session with streaming..."
  session = client.sessions.start(env: :LOCAL, verbose: 2, stream: true) do |event|
    if event[:type] == "log"
      puts "[LOG] #{event[:category]}: #{event[:message]}"
    end
  end
  session_id = session.session_id
  puts "Session ID: #{session_id}"

  # Navigate with streaming
  puts "\nNavigating with streaming..."
  client.sessions.navigate(session_id, url: "https://news.ycombinator.com", stream: true) do |event|
    puts "[NAV] #{event[:type]}: #{event[:message] || event[:status]}"
  end

  # Act with streaming logs
  puts "\nActing with streaming..."
  result = client.sessions.act(
    session_id,
    input: "click on the first article link",
    stream: true
  ) do |event|
    case event[:type]
    when "log"
      puts "[ACT LOG] #{event[:message]}"
    when "progress"
      puts "[ACT PROGRESS] #{event[:message]}"
    end
  end
  puts "Action completed: #{result.success}"

ensure
  client.sessions.end_(session_id) if session_id
end
