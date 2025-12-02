# Stagehand Ruby SDK

A thin, stateless Ruby SDK for the [Stagehand](https://github.com/browserbase/stagehand) browser automation API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "stagehand"
```

And then execute:

```bash
bundle install
```

Or install it yourself:

```bash
gem install stagehand
```

## Quick Start

```ruby
require "stagehand"

# Create a client
client = Stagehand::Client.new(api_key: ENV["STAGEHAND_API_KEY"])

# Start a session
session = client.sessions.start(env: :LOCAL)
session_id = session.session_id

# Navigate to a page
client.sessions.navigate(session_id, url: "https://example.com")

# Perform actions with natural language
client.sessions.act(session_id, input: "click the sign in button")

# Extract data from the page
data = client.sessions.extract(
  session_id,
  instruction: "extract the main heading text"
)
puts data.extraction

# End the session
client.sessions.end_(session_id)
```

## Configuration

### Client Options

```ruby
client = Stagehand::Client.new(
  api_key: "your-api-key",      # API key for authentication
  environment: :production,      # :production or :local
  base_url: "https://...",       # Custom base URL (optional)
  timeout: 120                   # Request timeout in seconds
)
```

### Using a Configuration Block

```ruby
client = Stagehand::Client.new do |config|
  config.api_key = ENV["STAGEHAND_API_KEY"]
  config.environment = :production
  config.timeout = 60
end
```

### Environment Variables

The SDK will automatically use `STAGEHAND_API_KEY` from environment if not provided.

## API Reference

### Sessions

All browser automation happens through the `sessions` resource.

#### `start`

Initialize a new browser session.

```ruby
response = client.sessions.start(
  env: :LOCAL,                    # :LOCAL or :BROWSERBASE
  api_key: "browserbase-key",     # For Browserbase environment
  project_id: "project-id",       # For Browserbase environment
  model: "openai/gpt-4o",         # AI model to use
  system_prompt: "...",           # Custom system prompt
  self_heal: true,                # Enable self-healing
  dom_settle_timeout: 5000,       # DOM settle timeout in ms
  verbose: 1,                     # Verbosity level (0-2)
  local_browser_launch_options: {
    headless: false,
    executable_path: "/path/to/chrome"
  }
)

session_id = response.session_id
```

#### `navigate`

Navigate to a URL.

```ruby
response = client.sessions.navigate(
  session_id,
  url: "https://example.com",
  options: {
    wait_until: :networkidle  # :load, :domcontentloaded, or :networkidle
  }
)
```

#### `act`

Perform a browser action using natural language.

```ruby
response = client.sessions.act(
  session_id,
  input: "click the sign in button",
  options: {
    model: "openai/gpt-4o",
    timeout: 30000,
    variables: { username: "john" }
  }
)

puts response.success
puts response.message
response.actions.each { |action| puts action.description }
```

#### `extract`

Extract data from the page.

```ruby
# Simple extraction
response = client.sessions.extract(
  session_id,
  instruction: "extract the main heading"
)
puts response.extraction

# Structured extraction with schema
data = client.sessions.extract(
  session_id,
  instruction: "extract product information",
  options: {
    schema: {
      type: "object",
      properties: {
        name: { type: "string" },
        price: { type: "number" }
      }
    }
  }
)
```

#### `observe`

Get a list of actionable elements on the page.

```ruby
response = client.sessions.observe(
  session_id,
  instruction: "find all buttons"
)

response.actions.each do |action|
  puts "#{action.method}: #{action.description}"
  puts "  Selector: #{action.selector}"
end
```

#### `execute_agent`

Run an autonomous agent for complex tasks.

```ruby
response = client.sessions.execute_agent(
  session_id,
  execute_options: {
    instruction: "Find and add the first product to cart",
    max_steps: 10,
    highlight_cursor: true
  },
  agent_config: {
    model: "openai/gpt-4o",
    provider: :openai
  }
)

puts response.message
response.steps.each { |step| puts step }
```

#### `end_`

Close the session and clean up resources.

```ruby
response = client.sessions.end_(session_id)
puts response.success
```

### Streaming Responses

All methods support streaming for real-time log output:

```ruby
response = client.sessions.act(
  session_id,
  input: "fill in the form",
  stream: true
) do |event|
  case event[:type]
  when "log"
    puts "[#{event[:category]}] #{event[:message]}"
  end
end
```

### Model Configuration

Models can be specified as strings or configuration objects:

```ruby
# Simple string format
model: "openai/gpt-4o"

# Full configuration
model: {
  model: "gpt-4o",
  api_key: "your-key",
  base_url: "https://custom-endpoint.com"
}

# Using the type class
model: Stagehand::Types::ModelConfig.new(
  model: "gpt-4o",
  provider: :openai
)
```

## Error Handling

```ruby
begin
  client.sessions.act(session_id, input: "click button")
rescue Stagehand::AuthenticationError => e
  puts "Authentication failed: #{e.message}"
rescue Stagehand::NotFoundError => e
  puts "Session not found: #{e.message}"
rescue Stagehand::ValidationError => e
  puts "Invalid request: #{e.message}"
rescue Stagehand::RateLimitError => e
  puts "Rate limited: #{e.message}"
rescue Stagehand::APIError => e
  puts "API error (#{e.status}): #{e.message}"
rescue Stagehand::ConnectionError => e
  puts "Connection failed: #{e.message}"
end
```

## Types

The SDK provides typed response objects:

- `Stagehand::Types::SessionStartResponse`
- `Stagehand::Types::SessionActResponse`
- `Stagehand::Types::SessionExtractResponse`
- `Stagehand::Types::SessionObserveResponse`
- `Stagehand::Types::SessionNavigateResponse`
- `Stagehand::Types::SessionExecuteAgentResponse`
- `Stagehand::Types::SessionEndResponse`
- `Stagehand::Types::Action`
- `Stagehand::Types::ModelConfig`

## License

MIT License - see LICENSE file for details.
