# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2024-12-02

### Added

- Initial release
- `Client` class for API interaction
- `Sessions` resource with all methods:
  - `start` - Initialize a browser session
  - `navigate` - Navigate to a URL
  - `act` - Perform browser actions with natural language
  - `extract` - Extract data from pages
  - `observe` - Get actionable elements
  - `execute_agent` - Run autonomous agents
  - `end_` - Close sessions
- Streaming support for all methods
- Typed response objects
- Error handling with specific exception classes
- Configuration via constructor, block, or environment variables
