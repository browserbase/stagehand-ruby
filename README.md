<div id="toc" align="center" style="margin-bottom: 0;">
  <ul style="list-style: none; margin: 0; padding: 0;">
    <a href="https://stagehand.dev">
      <picture>
        <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/browserbase/stagehand/main/media/dark_logo.png" />
        <img alt="Stagehand" src="https://raw.githubusercontent.com/browserbase/stagehand/main/media/light_logo.png" width="200" style="margin-right: 30px;" />
      </picture>
    </a>
  </ul>
</div>
<p align="center">
  <strong>The AI Browser Automation Framework</strong><br>
  <a href="https://docs.stagehand.dev/v3/sdk/ruby">Read the Docs</a>
</p>

<p align="center">
  <a href="https://github.com/browserbase/stagehand/tree/main?tab=MIT-1-ov-file#MIT-1-ov-file">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/browserbase/stagehand/main/media/dark_license.svg" />
      <img alt="MIT License" src="https://raw.githubusercontent.com/browserbase/stagehand/main/media/light_license.svg" />
    </picture>
  </a>
  <a href="https://stagehand.dev/discord">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/browserbase/stagehand/main/media/dark_discord.svg" />
      <img alt="Discord Community" src="https://raw.githubusercontent.com/browserbase/stagehand/main/media/light_discord.svg" />
    </picture>
  </a>
</p>

<p align="center">
	<a href="https://trendshift.io/repositories/12122" target="_blank"><img src="https://trendshift.io/api/badge/repositories/12122" alt="browserbase%2Fstagehand | Trendshift" style="width: 250px; height: 55px;" width="250" height="55"/></a>
</p>

<p align="center">
If you're looking for other languages, you can find them
<a href="https://docs.stagehand.dev/v3/first-steps/introduction"> here</a>
</p>

<div align="center" style="display: flex; align-items: center; justify-content: center; gap: 4px; margin-bottom: 0;">
  <b>Vibe code</b>
  <span style="font-size: 1.05em;"> Stagehand with </span>
  <a href="https://director.ai" style="display: flex; align-items: center;">
    <span>Director</span>
  </a>
  <span> </span>
  <picture>
    <img alt="Director" src="https://raw.githubusercontent.com/browserbase/stagehand/main/media/director_icon.svg" width="25" />
  </picture>
</div>

## What is Stagehand?

Stagehand is a browser automation framework used to control web browsers with natural language and code. By combining the power of AI with the precision of code, Stagehand makes web automation flexible, maintainable, and actually reliable.

## Why Stagehand?

Most existing browser automation tools either require you to write low-level code in a framework like Selenium, Playwright, or Puppeteer, or use high-level agents that can be unpredictable in production. By letting developers choose what to write in code vs. natural language (and bridging the gap between the two) Stagehand is the natural choice for browser automations in production.

1. **Choose when to write code vs. natural language**: use AI when you want to navigate unfamiliar pages, and use code when you know exactly what you want to do.

2. **Go from AI-driven to repeatable workflows**: Stagehand lets you preview AI actions before running them, and also helps you easily cache repeatable actions to save time and tokens.

3. **Write once, run forever**: Stagehand's auto-caching combined with self-healing remembers previous actions, runs without LLM inference, and knows when to involve AI whenever the website changes and your automation breaks.

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "stagehand", "~> 3.2.0"
```

<!-- x-release-please-end -->

## Usage

```ruby
require "bundler/setup"
require "stagehand"

# Create a new Stagehand client with your credentials
client = Stagehand::Client.new(
  browserbase_api_key: ENV["BROWSERBASE_API_KEY"],      # defaults to ENV["BROWSERBASE_API_KEY"]
  browserbase_project_id: ENV["BROWSERBASE_PROJECT_ID"], # defaults to ENV["BROWSERBASE_PROJECT_ID"]
  model_api_key: ENV["MODEL_API_KEY"]                   # defaults to ENV["MODEL_API_KEY"]
)

# Start a new browser session
start_response = client.sessions.start(
  model_name: "openai/gpt-5-nano"
)
puts "Session started: #{start_response.data.session_id}"

session_id = start_response.data.session_id

# Navigate to a webpage
client.sessions.navigate(
  session_id,
  url: "https://news.ycombinator.com"
)
puts "Navigated to Hacker News"

# Use Observe to find possible actions on the page
observe_response = client.sessions.observe(
  session_id,
  instruction: "find the link to view comments for the top post"
)

actions = observe_response.data.result
puts "Found #{actions.length} possible actions"

# Take the first action returned by Observe
action = actions.first
puts "Acting on: #{action.description}"

# Pass the structured action to Act
# Convert the observe result to a hash and ensure method is set to "click"
act_response = client.sessions.act(
  session_id,
  input: action.to_h.merge(method: "click")
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
  }
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
  }
)
puts "Agent completed: #{execute_response.data.result[:message]}"
puts "Agent success: #{execute_response.data.result[:success]}"
puts "Agent actions taken: #{execute_response.data.result[:actions]&.length || 0}"

# End the session to cleanup browser resources
client.sessions.end_(session_id)
puts "Session ended"
```

### Running the Examples

Install dependencies, set credentials, and run the scripts below.

```bash
# Install the gem dependencies
bundle install
```

Remote browser example:

```bash
export BROWSERBASE_API_KEY="your-browserbase-api-key"
export BROWSERBASE_PROJECT_ID="your-browserbase-project-id"
export MODEL_API_KEY="your-openai-api-key"
bundle exec ruby examples/remote_browser_example.rb
```

Local mode example (embedded server, local Chrome/Chromium):

```bash
export MODEL_API_KEY="your-openai-api-key"
bundle exec ruby examples/local_browser_example.rb
```

Playwright local example:

```bash
gem install playwright-ruby-client
npm install playwright
./node_modules/.bin/playwright install chromium
export MODEL_API_KEY="your-openai-api-key"
bundle exec ruby examples/local_playwright_example.rb
```

Playwright remote example:

```bash
gem install playwright-ruby-client
npm install playwright
./node_modules/.bin/playwright install chromium
export BROWSERBASE_API_KEY="your-browserbase-api-key"
export BROWSERBASE_PROJECT_ID="your-browserbase-project-id"
export MODEL_API_KEY="your-openai-api-key"
bundle exec ruby examples/remote_playwright_example.rb
```

Watir local example:

```bash
gem install watir
export MODEL_API_KEY="your-openai-api-key"
bundle exec ruby examples/local_watir_example.rb
```

### Streaming

We provide support for streaming responses using Server-Sent Events (SSE).

```ruby
stream = stagehand.sessions.act_streaming(
  "00000000-your-session-id-000000000000",
  input: "click the first link on the page"
)

stream.each do |session|
  puts(session.data)
end
```

### Handling errors

When the library is unable to connect to the API, or if the API returns a non-success status code (i.e., 4xx or 5xx response), a subclass of `Stagehand::Errors::APIError` will be thrown:

```ruby
begin
  session = stagehand.sessions.start(model_name: "openai/gpt-5-nano")
rescue Stagehand::Errors::APIConnectionError => e
  puts("The server could not be reached")
  puts(e.cause)  # an underlying Exception, likely raised within `net/http`
rescue Stagehand::Errors::RateLimitError => e
  puts("A 429 status code was received; we should back off a bit.")
rescue Stagehand::Errors::APIStatusError => e
  puts("Another non-200-range status code was received")
  puts(e.status)
end
```

Error codes are as follows:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >= 500      | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short exponential backoff.

Connection errors (for example, due to a network connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors, and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
stagehand = Stagehand::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
stagehand.sessions.start(model_name: "openai/gpt-5-nano", request_options: {max_retries: 5})
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
stagehand = Stagehand::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
stagehand.sessions.start(model_name: "openai/gpt-5-nano", request_options: {timeout: 5})
```

On timeout, `Stagehand::Errors::APITimeoutError` is raised.

Note that requests that time out are retried by default.

## Advanced concepts

### BaseModel

All parameter and response objects inherit from `Stagehand::Internal::Type::BaseModel`, which provides several conveniences, including:

1. All fields, including unknown ones, are accessible with `obj[:prop]` syntax, and can be destructured with `obj => {prop: prop}` or pattern-matching syntax.

2. Structural equivalence for equality; if two API calls return the same values, comparing the responses with == will return true.

3. Both instances and the classes themselves can be pretty-printed.

4. Helpers such as `#to_h`, `#deep_to_h`, `#to_json`, and `#to_yaml`.

### Making custom or undocumented requests

#### Undocumented properties

You can send undocumented parameters to any endpoint, and read undocumented response properties, like so:

Note: the `extra_` parameters of the same name overrides the documented parameters.

```ruby
response =
  stagehand.sessions.start(
    model_name: "openai/gpt-5-nano",
    request_options: {
      extra_query: {my_query_parameter: value},
      extra_body: {my_body_parameter: value},
      extra_headers: {"my-header": value}
    }
  )

puts(response[:my_undocumented_property])
```

#### Undocumented request params

If you want to explicitly send an extra param, you can do so with the `extra_query`, `extra_body`, and `extra_headers` under the `request_options:` parameter when making a request, as seen in the examples above.

#### Undocumented endpoints

To make requests to undocumented endpoints while retaining the benefit of auth, retries, and so on, you can make requests using `client.request`, like so:

```ruby
response = client.request(
  method: :post,
  path: '/undocumented/endpoint',
  query: {"dog": "woof"},
  headers: {"useful-header": "interesting-value"},
  body: {"hello": "world"}
)
```

### Concurrency & connection pooling

The `Stagehand::Client` instances are threadsafe, but are only are fork-safe when there are no in-flight HTTP requests.

Each instance of `Stagehand::Client` has its own HTTP connection pool with a default size of 99. As such, we recommend instantiating the client once per application in most settings.

When all available connections from the pool are checked out, requests wait for a new connection to become available, with queue time counting towards the request timeout.

Unless otherwise specified, other classes in the SDK do not have locks protecting their underlying data structure.

## Sorbet

This library provides comprehensive [RBI](https://sorbet.org/docs/rbi) definitions, and has no dependency on sorbet-runtime.

You can provide typesafe request parameters like so:

```ruby
stagehand.sessions.act("00000000-your-session-id-000000000000", input: "click the first link on the page")
```

Or, equivalently:

```ruby
# Hashes work, but are not typesafe:
stagehand.sessions.act("00000000-your-session-id-000000000000", input: "click the first link on the page")

# You can also splat a full Params class:
params = Stagehand::SessionActParams.new(input: "click the first link on the page")
stagehand.sessions.act("00000000-your-session-id-000000000000", **params)
```

### Enums

Since this library does not depend on `sorbet-runtime`, it cannot provide [`T::Enum`](https://sorbet.org/docs/tenum) instances. Instead, we provide "tagged symbols" instead, which is always a primitive at runtime:

```ruby
# :true
puts(Stagehand::SessionActParams::XStreamResponse::TRUE)

# Revealed type: `T.all(Stagehand::SessionActParams::XStreamResponse, Symbol)`
T.reveal_type(Stagehand::SessionActParams::XStreamResponse::TRUE)
```

Enum parameters have a "relaxed" type, so you can either pass in enum constants or their literal value:

```ruby
# Using the enum constants preserves the tagged type information:
stagehand.sessions.act(
  x_stream_response: Stagehand::SessionActParams::XStreamResponse::TRUE,
  # …
)

# Literal values are also permissible:
stagehand.sessions.act(
  x_stream_response: :true,
  # …
)
```

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the library is in initial development and has a major version of `0`, APIs may change at any time.

This package considers improvements to the (non-runtime) `*.rbi` and `*.rbs` type definitions to be non-breaking changes.

## Requirements

Ruby 3.2.0 or higher.

## Contributing

See [the contributing documentation](https://github.com/browserbase/stagehand-ruby/tree/main/CONTRIBUTING.md).
