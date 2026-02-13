# frozen_string_literal: true

module ExampleEnv
  REQUIRED_KEYS = %w[
    STAGEHAND_API_URL
    MODEL_API_KEY
    BROWSERBASE_API_KEY
    BROWSERBASE_PROJECT_ID
  ].freeze

  def self.load!
    env_path = find_env_path
    raise "Missing examples/.env (expected in repo examples/ directory)." unless env_path

    File.readlines(env_path, chomp: true).each do |line|
      trimmed = line.strip
      next if trimmed.empty? || trimmed.start_with?("#")

      key, value = trimmed.split("=", 2)
      next if key.nil? || value.nil?

      ENV[key] ||= value
    end

    missing = REQUIRED_KEYS.select { |key| ENV[key].to_s.empty? }
    unless missing.empty?
      raise "Missing required env vars: #{missing.join(', ')} (from examples/.env)"
    end

    ENV["STAGEHAND_BASE_URL"] ||= ENV["STAGEHAND_API_URL"]
  end

  def self.find_env_path
    current = File.expand_path(Dir.pwd)
    loop do
      candidate = File.join(current, "examples", ".env")
      return candidate if File.exist?(candidate)

      parent = File.dirname(current)
      return nil if parent == current

      current = parent
    end
  end
end
