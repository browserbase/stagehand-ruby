# typed: strong

module Stagehand
  module Resources
    class Sessions
      # See {Stagehand::Resources::Sessions#act_streaming} for streaming counterpart.
      #
      # Executes a browser action using natural language instructions or a predefined
      # Action object.
      sig do
        params(
          id: String,
          input: T.any(String, Stagehand::Action::OrHash),
          frame_id: String,
          options: Stagehand::SessionActParams::Options::OrHash,
          x_language: Stagehand::SessionActParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionActParams::XStreamResponse::OrSymbol,
          stream_response: T.noreturn,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionActResponse)
      end
      def act(
        # Path param: Unique session identifier
        id,
        # Body param: Natural language instruction or Action object
        input:,
        # Body param: Target frame ID for the action
        frame_id: nil,
        # Body param:
        options: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        # There is no need to provide `stream_response:`. Instead, use `#act_streaming` or
        # `#act` for streaming and non-streaming use cases, respectively.
        stream_response: false,
        request_options: {}
      )
      end

      # See {Stagehand::Resources::Sessions#act} for non-streaming counterpart.
      #
      # Executes a browser action using natural language instructions or a predefined
      # Action object.
      sig do
        params(
          id: String,
          input: T.any(String, Stagehand::Action::OrHash),
          frame_id: String,
          options: Stagehand::SessionActParams::Options::OrHash,
          x_language: Stagehand::SessionActParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionActParams::XStreamResponse::OrSymbol,
          stream_response: T.noreturn,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Internal::Stream[Stagehand::StreamEvent])
      end
      def act_streaming(
        # Path param: Unique session identifier
        id,
        # Body param: Natural language instruction or Action object
        input:,
        # Body param: Target frame ID for the action
        frame_id: nil,
        # Body param:
        options: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        # There is no need to provide `stream_response:`. Instead, use `#act_streaming` or
        # `#act` for streaming and non-streaming use cases, respectively.
        stream_response: true,
        request_options: {}
      )
      end

      # Terminates the browser session and releases all associated resources.
      sig do
        params(
          id: String,
          x_language: Stagehand::SessionEndParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionEndParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionEndResponse)
      end
      def end_(
        # Unique session identifier
        id,
        # Client SDK language
        x_language: nil,
        # Version of the Stagehand SDK
        x_sdk_version: nil,
        # ISO timestamp when request was sent
        x_sent_at: nil,
        # Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      # See {Stagehand::Resources::Sessions#execute_streaming} for streaming
      # counterpart.
      #
      # Runs an autonomous AI agent that can perform complex multi-step browser tasks.
      sig do
        params(
          id: String,
          agent_config: Stagehand::SessionExecuteParams::AgentConfig::OrHash,
          execute_options:
            Stagehand::SessionExecuteParams::ExecuteOptions::OrHash,
          frame_id: String,
          x_language: Stagehand::SessionExecuteParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionExecuteParams::XStreamResponse::OrSymbol,
          stream_response: T.noreturn,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionExecuteResponse)
      end
      def execute(
        # Path param: Unique session identifier
        id,
        # Body param:
        agent_config:,
        # Body param:
        execute_options:,
        # Body param: Target frame ID for the agent
        frame_id: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        # There is no need to provide `stream_response:`. Instead, use
        # `#execute_streaming` or `#execute` for streaming and non-streaming use cases,
        # respectively.
        stream_response: false,
        request_options: {}
      )
      end

      # See {Stagehand::Resources::Sessions#execute} for non-streaming counterpart.
      #
      # Runs an autonomous AI agent that can perform complex multi-step browser tasks.
      sig do
        params(
          id: String,
          agent_config: Stagehand::SessionExecuteParams::AgentConfig::OrHash,
          execute_options:
            Stagehand::SessionExecuteParams::ExecuteOptions::OrHash,
          frame_id: String,
          x_language: Stagehand::SessionExecuteParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionExecuteParams::XStreamResponse::OrSymbol,
          stream_response: T.noreturn,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Internal::Stream[Stagehand::StreamEvent])
      end
      def execute_streaming(
        # Path param: Unique session identifier
        id,
        # Body param:
        agent_config:,
        # Body param:
        execute_options:,
        # Body param: Target frame ID for the agent
        frame_id: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        # There is no need to provide `stream_response:`. Instead, use
        # `#execute_streaming` or `#execute` for streaming and non-streaming use cases,
        # respectively.
        stream_response: true,
        request_options: {}
      )
      end

      # See {Stagehand::Resources::Sessions#extract_streaming} for streaming
      # counterpart.
      #
      # Extracts structured data from the current page using AI-powered analysis.
      sig do
        params(
          id: String,
          frame_id: String,
          instruction: String,
          options: Stagehand::SessionExtractParams::Options::OrHash,
          schema: T::Hash[Symbol, T.anything],
          x_language: Stagehand::SessionExtractParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionExtractParams::XStreamResponse::OrSymbol,
          stream_response: T.noreturn,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionExtractResponse)
      end
      def extract(
        # Path param: Unique session identifier
        id,
        # Body param: Target frame ID for the extraction
        frame_id: nil,
        # Body param: Natural language instruction for what to extract
        instruction: nil,
        # Body param:
        options: nil,
        # Body param: JSON Schema defining the structure of data to extract
        schema: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        # There is no need to provide `stream_response:`. Instead, use
        # `#extract_streaming` or `#extract` for streaming and non-streaming use cases,
        # respectively.
        stream_response: false,
        request_options: {}
      )
      end

      # See {Stagehand::Resources::Sessions#extract} for non-streaming counterpart.
      #
      # Extracts structured data from the current page using AI-powered analysis.
      sig do
        params(
          id: String,
          frame_id: String,
          instruction: String,
          options: Stagehand::SessionExtractParams::Options::OrHash,
          schema: T::Hash[Symbol, T.anything],
          x_language: Stagehand::SessionExtractParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionExtractParams::XStreamResponse::OrSymbol,
          stream_response: T.noreturn,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Internal::Stream[Stagehand::StreamEvent])
      end
      def extract_streaming(
        # Path param: Unique session identifier
        id,
        # Body param: Target frame ID for the extraction
        frame_id: nil,
        # Body param: Natural language instruction for what to extract
        instruction: nil,
        # Body param:
        options: nil,
        # Body param: JSON Schema defining the structure of data to extract
        schema: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        # There is no need to provide `stream_response:`. Instead, use
        # `#extract_streaming` or `#extract` for streaming and non-streaming use cases,
        # respectively.
        stream_response: true,
        request_options: {}
      )
      end

      # Navigates the browser to the specified URL.
      sig do
        params(
          id: String,
          url: String,
          frame_id: String,
          options: Stagehand::SessionNavigateParams::Options::OrHash,
          stream_response: T::Boolean,
          x_language: Stagehand::SessionNavigateParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionNavigateParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionNavigateResponse)
      end
      def navigate(
        # Path param: Unique session identifier
        id,
        # Body param: URL to navigate to
        url:,
        # Body param: Target frame ID for the navigation
        frame_id: nil,
        # Body param:
        options: nil,
        # Body param: Whether to stream the response via SSE
        stream_response: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      # See {Stagehand::Resources::Sessions#observe_streaming} for streaming
      # counterpart.
      #
      # Identifies and returns available actions on the current page that match the
      # given instruction.
      sig do
        params(
          id: String,
          frame_id: String,
          instruction: String,
          options: Stagehand::SessionObserveParams::Options::OrHash,
          x_language: Stagehand::SessionObserveParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionObserveParams::XStreamResponse::OrSymbol,
          stream_response: T.noreturn,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionObserveResponse)
      end
      def observe(
        # Path param: Unique session identifier
        id,
        # Body param: Target frame ID for the observation
        frame_id: nil,
        # Body param: Natural language instruction for what actions to find
        instruction: nil,
        # Body param:
        options: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        # There is no need to provide `stream_response:`. Instead, use
        # `#observe_streaming` or `#observe` for streaming and non-streaming use cases,
        # respectively.
        stream_response: false,
        request_options: {}
      )
      end

      # See {Stagehand::Resources::Sessions#observe} for non-streaming counterpart.
      #
      # Identifies and returns available actions on the current page that match the
      # given instruction.
      sig do
        params(
          id: String,
          frame_id: String,
          instruction: String,
          options: Stagehand::SessionObserveParams::Options::OrHash,
          x_language: Stagehand::SessionObserveParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionObserveParams::XStreamResponse::OrSymbol,
          stream_response: T.noreturn,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Internal::Stream[Stagehand::StreamEvent])
      end
      def observe_streaming(
        # Path param: Unique session identifier
        id,
        # Body param: Target frame ID for the observation
        frame_id: nil,
        # Body param: Natural language instruction for what actions to find
        instruction: nil,
        # Body param:
        options: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        # There is no need to provide `stream_response:`. Instead, use
        # `#observe_streaming` or `#observe` for streaming and non-streaming use cases,
        # respectively.
        stream_response: true,
        request_options: {}
      )
      end

      # Creates a new browser session with the specified configuration. Returns a
      # session ID used for all subsequent operations.
      sig do
        params(
          model_name: String,
          act_timeout_ms: Float,
          browser: Stagehand::SessionStartParams::Browser::OrHash,
          browserbase_session_create_params:
            Stagehand::SessionStartParams::BrowserbaseSessionCreateParams::OrHash,
          browserbase_session_id: String,
          dom_settle_timeout_ms: Float,
          experimental: T::Boolean,
          self_heal: T::Boolean,
          system_prompt: String,
          verbose: Stagehand::SessionStartParams::Verbose::OrSymbol,
          wait_for_captcha_solves: T::Boolean,
          x_language: Stagehand::SessionStartParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionStartParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionStartResponse)
      end
      def start(
        # Body param: Model name to use for AI operations
        model_name:,
        # Body param: Timeout in ms for act operations (deprecated, v2 only)
        act_timeout_ms: nil,
        # Body param:
        browser: nil,
        # Body param:
        browserbase_session_create_params: nil,
        # Body param: Existing Browserbase session ID to resume
        browserbase_session_id: nil,
        # Body param: Timeout in ms to wait for DOM to settle
        dom_settle_timeout_ms: nil,
        # Body param:
        experimental: nil,
        # Body param: Enable self-healing for failed actions
        self_heal: nil,
        # Body param: Custom system prompt for AI operations
        system_prompt: nil,
        # Body param: Logging verbosity level (0=quiet, 1=normal, 2=debug)
        verbose: nil,
        # Body param: Wait for captcha solves (deprecated, v2 only)
        wait_for_captcha_solves: nil,
        # Header param: Client SDK language
        x_language: nil,
        # Header param: Version of the Stagehand SDK
        x_sdk_version: nil,
        # Header param: ISO timestamp when request was sent
        x_sent_at: nil,
        # Header param: Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Stagehand::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
