# Stagehand Ruby API library

<!-- x-stagehand-custom-start -->
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
<!-- x-stagehand-custom-end -->

The Stagehand Ruby library provides convenient access to the Stagehand REST API from any Ruby 3.2.0+ application. It ships with comprehensive types & docstrings in Yard, RBS, and RBI – [see below](https://github.com/browserbase/stagehand-ruby#Sorbet) for usage with Sorbet. The standard library's `net/http` is used as the HTTP transport, with connection pooling via the `connection_pool` gem.

It is generated with [Stainless](https://www.stainless.com/).

## Documentation

Documentation for releases of this gem can be found [on RubyDoc](https://gemdocs.org/gems/stagehand).

The REST API documentation can be found on [docs.stagehand.dev](https://docs.stagehand.dev).

## Installation

To use this gem, install via Bundler by adding the following to your application's `Gemfile`:

<!-- x-release-please-start-version -->

```ruby
gem "stagehand", :git => "git://github.com/browserbase/stagehand-ruby.git"
```

<!-- x-release-please-end -->

## Usage

This mirrors `examples/remote_browser_playwright_example.rb`.

```ruby
require "bundler/setup"
require "stagehand"

require_relative "examples/env"
ExampleEnv.load!

require "playwright"

client = Stagehand::Client.new(
  browserbase_api_key: ENV["BROWSERBASE_API_KEY"],
  browserbase_project_id: ENV["BROWSERBASE_PROJECT_ID"],
  model_api_key: ENV["MODEL_API_KEY"],
  server: "remote"
)

start_response = client.sessions.start(
  model_name: "anthropic/claude-sonnet-4-6",
  browser: { type: :browserbase }
)

session_id = start_response.data.session_id
cdp_url = start_response.data.cdp_url
raise "No CDP URL returned for this session." if cdp_url.to_s.empty?

Playwright.create(playwright_cli_executable_path: "./node_modules/.bin/playwright") do |playwright|
  browser = playwright.chromium.connect_over_cdp(cdp_url)
  context = browser.contexts.first || browser.new_context
  page = context.pages.first || context.new_page

  client.sessions.navigate(session_id, url: "https://news.ycombinator.com")
  page.wait_for_load_state(state: "domcontentloaded")

  observe_stream = client.sessions.observe_streaming(
    session_id,
    instruction: "find the link to view comments for the top post"
  )
  observe_stream.each { |_event| }

  act_stream = client.sessions.act_streaming(
    session_id,
    input: "Click the comments link for the top post"
  )
  act_stream.each { |_event| }

  extract_stream = client.sessions.extract_streaming(
    session_id,
    instruction: "extract the text of the top comment on this page",
    schema: {
      type: "object",
      properties: {
        commentText: {type: "string"},
        author: {type: "string"}
      },
      required: ["commentText"]
    }
  )
  extract_stream.each { |_event| }

  execute_stream = client.sessions.execute_streaming(
    session_id,
    execute_options: {
      instruction: "Click the 'Learn more' link if available",
      max_steps: 3
    },
    agent_config: {
      model: Stagehand::ModelConfig.new(
        model_name: "anthropic/claude-sonnet-4-6",
        api_key: ENV["MODEL_API_KEY"]
      ),
      cua: false
    }
  )
  execute_stream.each { |_event| }
end

client.sessions.end_(session_id)
```

## Running the Example

Set your environment variables (from `examples/.env.example`):

- `STAGEHAND_API_URL`
- `MODEL_API_KEY`
- `BROWSERBASE_API_KEY`
- `BROWSERBASE_PROJECT_ID`

```bash
cp examples/.env.example examples/.env
# Edit examples/.env with your credentials.
```

The examples load `examples/.env` automatically.

Examples and dependencies:

- `examples/remote_browser_example.rb`: stagehand only
- `examples/local_browser_example.rb`: stagehand only
- `examples/remote_browser_playwright_example.rb`: `playwright-ruby-client` + Playwright browsers
- `examples/local_browser_playwright_example.rb`: `playwright-ruby-client` + Playwright browsers
- `examples/local_playwright_example.rb`: `playwright-ruby-client` + Playwright browsers
- `examples/local_watir_example.rb`: `watir`

Install dependencies for the example you want to run, then execute it:

```bash
bundle install
bundle exec ruby examples/remote_browser_playwright_example.rb
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
  session = stagehand.sessions.start(model_name: "anthropic/claude-sonnet-4-6")
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
stagehand.sessions.start(model_name: "anthropic/claude-sonnet-4-6", request_options: {max_retries: 5})
```

### Timeouts

By default, requests will time out after 60 seconds. You can use the timeout option to configure or disable this:

```ruby
# Configure the default for all requests:
stagehand = Stagehand::Client.new(
  timeout: nil # default is 60
)

# Or, configure per-request:
stagehand.sessions.start(model_name: "anthropic/claude-sonnet-4-6", request_options: {timeout: 5})
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
    model_name: "anthropic/claude-sonnet-4-6",
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
