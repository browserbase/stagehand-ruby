#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/stagehand"

# Example demonstrating streaming responses

client = Stagehand::Client.new(api_key: ENV["STAGEHAND_API_KEY"])

begin
  # Start session with streaming logs
  puts "Starting session with streaming..."
  client.session.start(env: :LOCAL, verbose: 2, stream: true) do |event|
    if event[:type] == "log"
      puts "[LOG] #{event[:category]}: #{event[:message]}"
    end
  end
  puts "Session ID: #{client.session.session_id}"

  # Navigate with streaming
  puts "\nNavigating with streaming..."
  client.session.navigate(url: "https://news.ycombinator.com", stream: true) do |event|
    puts "[NAV] #{event[:type]}: #{event[:message] || event[:status]}"
  end

  # Act with streaming logs
  puts "\nActing with streaming..."
  result = client.session.act(
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
  client.session.end_ if client.session.active?
end
