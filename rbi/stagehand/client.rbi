# typed: strong

module Stagehand
  class Client < Stagehand::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(String) }
    attr_reader :browserbase_api_key

    sig { returns(String) }
    attr_reader :browserbase_project_id

    sig { returns(T.nilable(String)) }
    attr_reader :model_api_key

    sig { returns(Stagehand::Resources::Sessions) }
    attr_reader :sessions

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def bb_api_key_auth
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def bb_project_id_auth
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def llm_model_api_key_auth
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        browserbase_api_key: T.nilable(String),
        browserbase_project_id: T.nilable(String),
        model_api_key: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["BROWSERBASE_API_KEY"]`
      browserbase_api_key: ENV["BROWSERBASE_API_KEY"],
      # Defaults to `ENV["BROWSERBASE_PROJECT_ID"]`
      browserbase_project_id: ENV["BROWSERBASE_PROJECT_ID"],
      # Defaults to `ENV["MODEL_API_KEY"]`
      model_api_key: ENV["MODEL_API_KEY"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["STAGEHAND_BASE_URL"]`
      base_url: ENV["STAGEHAND_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Stagehand::Client::DEFAULT_MAX_RETRIES,
      timeout: Stagehand::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Stagehand::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Stagehand::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
