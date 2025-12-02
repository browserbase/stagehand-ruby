# frozen_string_literal: true

module Stagehand
  # Configuration for the Stagehand client
  class Configuration
    ENVIRONMENTS = {
      production: "https://api.stagehand.dev",
      local: "http://localhost:3000"
    }.freeze

    attr_accessor :api_key, :base_url, :timeout, :open_timeout

    def initialize
      @api_key = ENV.fetch("STAGEHAND_API_KEY", nil)
      @base_url = ENVIRONMENTS[:production]
      @timeout = 120
      @open_timeout = 30
    end

    def environment=(env)
      env_sym = env.to_sym
      if ENVIRONMENTS.key?(env_sym)
        @base_url = ENVIRONMENTS[env_sym]
      else
        raise ArgumentError, "Unknown environment: #{env}. Valid: #{ENVIRONMENTS.keys.join(', ')}"
      end
    end
  end
end
