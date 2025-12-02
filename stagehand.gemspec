# frozen_string_literal: true

require_relative "lib/stagehand/version"

Gem::Specification.new do |spec|
  spec.name = "stagehand"
  spec.version = Stagehand::VERSION
  spec.authors = ["Browserbase"]
  spec.email = ["support@browserbase.com"]

  spec.summary = "Ruby SDK for the Stagehand browser automation API"
  spec.description = "A thin, stateless Ruby client for the Stagehand API - AI-powered browser automation"
  spec.homepage = "https://github.com/browserbase/stagehand-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"

  spec.files = Dir.glob("lib/**/*") + %w[README.md LICENSE CHANGELOG.md]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
end
