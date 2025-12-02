# frozen_string_literal: true

require_relative "stagehand/version"
require_relative "stagehand/errors"
require_relative "stagehand/configuration"
require_relative "stagehand/http_client"
require_relative "stagehand/types"
require_relative "stagehand/client"

# Stagehand - AI-powered browser automation
#
# A thin, nearly stateless Ruby SDK for the Stagehand API. The SDK provides a
# simple interface for browser automation using AI-powered actions, extraction,
# and observation.
#
# @example Quick start
#   require "stagehand"
#
#   client = Stagehand::Client.new(api_key: ENV["STAGEHAND_API_KEY"])
#
#   # Start a session (session_id is stored automatically)
#   client.session.start(env: :LOCAL)
#
#   # Navigate and interact
#   client.session.navigate(url: "https://example.com")
#   client.session.act(input: "click the sign in button")
#
#   # Extract data
#   data = client.session.extract(instruction: "extract the main heading")
#
#   # End session
#   client.session.end_
#
module Stagehand
  class << self
    # Configure the default client
    #
    # @yield [Configuration] Configuration block
    # @return [Configuration]
    def configure
      @configuration ||= Configuration.new
      yield @configuration if block_given?
      @configuration
    end

    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    # Create a new client with default configuration
    #
    # @return [Client]
    def client
      Client.new do |config|
        config.api_key = configuration.api_key
        config.base_url = configuration.base_url
        config.timeout = configuration.timeout
      end
    end
  end
end
