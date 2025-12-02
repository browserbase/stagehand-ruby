# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"

# Default spec task runs unit tests only
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = "spec/**/*_spec.rb"
  t.rspec_opts = "--tag ~integration"
end

# Integration tests (requires browser)
RSpec::Core::RakeTask.new(:integration) do |t|
  t.pattern = "spec/integration/**/*_spec.rb"
  t.rspec_opts = "--tag integration"
end

# All tests
RSpec::Core::RakeTask.new(:spec_all) do |t|
  t.pattern = "spec/**/*_spec.rb"
end

RuboCop::RakeTask.new

task default: %i[spec rubocop]
