# frozen_string_literal: true

require_relative "configuration"
require_relative "http_client"
require_relative "resources/session"

module Stagehand
  # Main client for the Stagehand API
  #
  # The client maintains minimal state - just the HTTP connection and the
  # session resource (which stores the session_id after start()).
  #
  # @example Basic usage
  #   client = Stagehand::Client.new(api_key: "your-api-key")
  #   client.session.start(env: :LOCAL)
  #   client.session.navigate(url: "https://example.com")
  #   client.session.act(input: "click the login button")
  #   client.session.end_
  #
  # @example With configuration block
  #   client = Stagehand::Client.new do |config|
  #     config.api_key = "your-api-key"
  #     config.environment = :production
  #     config.timeout = 60
  #   end
  #
  class Client
    attr_reader :config, :session

    # Initialize a new Stagehand client
    #
    # @param api_key [String, nil] API key for authentication
    # @param environment [Symbol, String] Environment (:production, :local)
    # @param base_url [String, nil] Custom base URL (overrides environment)
    # @param timeout [Integer] Request timeout in seconds
    # @yield [Configuration] Configuration block
    def initialize(api_key: nil, environment: nil, base_url: nil, timeout: nil, &block)
      @config = Configuration.new

      @config.api_key = api_key if api_key
      @config.environment = environment if environment
      @config.base_url = base_url if base_url
      @config.timeout = timeout if timeout

      yield @config if block_given?

      @http = HTTPClient.new(@config)
      @session = Resources::Session.new(@http)
    end
  end
end
