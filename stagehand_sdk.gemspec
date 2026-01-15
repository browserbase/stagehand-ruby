# frozen_string_literal: true

require_relative "lib/stagehand_sdk/version"

Gem::Specification.new do |s|
  s.name = "stagehand-sdk"
  s.version = StagehandSDK::VERSION
  s.summary = "Ruby library to access the Stagehand API"
  s.authors = ["Stagehand"]
  s.email = ""
  s.homepage = "https://gemdocs.org/gems/stagehand-sdk"
  s.metadata["homepage_uri"] = s.homepage
  s.metadata["source_code_uri"] = "https://github.com/browserbase/stagehand-ruby"
  s.metadata["rubygems_mfa_required"] = false.to_s
  s.required_ruby_version = ">= 3.2.0"

  s.files = Dir[
    "lib/**/*.rb",
    "rbi/**/*.rbi",
    "sig/**/*.rbs",
    "manifest.yaml",
    "SECURITY.md",
    "CHANGELOG.md",
    ".ignore"
  ]
  s.extra_rdoc_files = ["README.md"]
  s.add_dependency "cgi"
  s.add_dependency "connection_pool"
end
