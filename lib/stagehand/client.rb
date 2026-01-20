# frozen_string_literal: true

module Stagehand
  class Client < Stagehand::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # Your [Browserbase API Key](https://www.browserbase.com/settings)
    # @return [String]
    attr_reader :browserbase_api_key

    # Your [Browserbase Project ID](https://www.browserbase.com/settings)
    # @return [String]
    attr_reader :browserbase_project_id

    # Your LLM provider API key (e.g. OPENAI_API_KEY, ANTHROPIC_API_KEY, etc.)
    # @return [String]
    attr_reader :model_api_key

    # @return [Stagehand::Resources::Sessions]
    attr_reader :sessions

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      {**bb_api_key_auth, **bb_project_id_auth, **llm_model_api_key_auth}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def bb_api_key_auth
      {"x-bb-api-key" => @browserbase_api_key}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def bb_project_id_auth
      {"x-bb-project-id" => @browserbase_project_id}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def llm_model_api_key_auth
      {"x-model-api-key" => @model_api_key}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param browserbase_api_key [String, nil] Your [Browserbase API Key](https://www.browserbase.com/settings) Defaults to
    # `ENV["BROWSERBASE_API_KEY"]`
    #
    # @param browserbase_project_id [String, nil] Your [Browserbase Project ID](https://www.browserbase.com/settings) Defaults to
    # `ENV["BROWSERBASE_PROJECT_ID"]`
    #
    # @param model_api_key [String, nil] Your LLM provider API key (e.g. OPENAI_API_KEY, ANTHROPIC_API_KEY, etc.)
    # Defaults to `ENV["MODEL_API_KEY"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["STAGEHAND_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      browserbase_api_key: ENV["BROWSERBASE_API_KEY"],
      browserbase_project_id: ENV["BROWSERBASE_PROJECT_ID"],
      model_api_key: ENV["MODEL_API_KEY"],
      base_url: ENV["STAGEHAND_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.stagehand.browserbase.com"

      if browserbase_api_key.nil?
        raise ArgumentError.new("browserbase_api_key is required, and can be set via environ: \"BROWSERBASE_API_KEY\"")
      end
      if browserbase_project_id.nil?
        raise ArgumentError.new("browserbase_project_id is required, and can be set via environ: \"BROWSERBASE_PROJECT_ID\"")
      end
      if model_api_key.nil?
        raise ArgumentError.new("model_api_key is required, and can be set via environ: \"MODEL_API_KEY\"")
      end

      @browserbase_api_key = browserbase_api_key.to_s
      @browserbase_project_id = browserbase_project_id.to_s
      @model_api_key = model_api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay
      )

      @sessions = Stagehand::Resources::Sessions.new(client: self)
    end
  end
end
