# frozen_string_literal: true

module StagehandSDK
  module Resources
    class Sessions
      # See {StagehandSDK::Resources::Sessions#act_streaming} for streaming counterpart.
      #
      # Executes a browser action using natural language instructions or a predefined
      # Action object.
      #
      # @overload act(id, input:, frame_id: nil, options: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param input [String, StagehandSDK::Models::Action] Body param: Natural language instruction or Action object
      #
      # @param frame_id [String, nil] Body param: Target frame ID for the action
      #
      # @param options [StagehandSDK::Models::SessionActParams::Options] Body param
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionActParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Models::SessionActResponse]
      #
      # @see StagehandSDK::Models::SessionActParams
      def act(id, params)
        parsed, options = StagehandSDK::SessionActParams.dump_request(params)
        if parsed[:streamResponse]
          message = "Please use `#act_streaming` for the streaming use case."
          raise ArgumentError.new(message)
        end
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/act", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: StagehandSDK::Models::SessionActResponse,
          options: options
        )
      end

      # See {StagehandSDK::Resources::Sessions#act} for non-streaming counterpart.
      #
      # Executes a browser action using natural language instructions or a predefined
      # Action object.
      #
      # @overload act_streaming(id, input:, frame_id: nil, options: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param input [String, StagehandSDK::Models::Action] Body param: Natural language instruction or Action object
      #
      # @param frame_id [String, nil] Body param: Target frame ID for the action
      #
      # @param options [StagehandSDK::Models::SessionActParams::Options] Body param
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionActParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Internal::Stream<StagehandSDK::Models::StreamEvent>]
      #
      # @see StagehandSDK::Models::SessionActParams
      def act_streaming(id, params)
        parsed, options = StagehandSDK::SessionActParams.dump_request(params)
        unless parsed.fetch(:streamResponse, true)
          message = "Please use `#act` for the non-streaming use case."
          raise ArgumentError.new(message)
        end
        parsed.store(:streamResponse, true)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/act", id],
          headers: {
            "accept" => "text/event-stream",
            **parsed.slice(*header_params.keys)
          }.transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          stream: StagehandSDK::Internal::Stream,
          model: StagehandSDK::StreamEvent,
          options: options
        )
      end

      # Terminates the browser session and releases all associated resources.
      #
      # @overload end_(id, _force_body: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param _force_body [Object] Body param
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionEndParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Models::SessionEndResponse]
      #
      # @see StagehandSDK::Models::SessionEndParams
      def end_(id, params = {})
        parsed, options = StagehandSDK::SessionEndParams.dump_request(params)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/end", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: StagehandSDK::Models::SessionEndResponse,
          options: options
        )
      end

      # See {StagehandSDK::Resources::Sessions#execute_streaming} for streaming
      # counterpart.
      #
      # Runs an autonomous AI agent that can perform complex multi-step browser tasks.
      #
      # @overload execute(id, agent_config:, execute_options:, frame_id: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param agent_config [StagehandSDK::Models::SessionExecuteParams::AgentConfig] Body param
      #
      # @param execute_options [StagehandSDK::Models::SessionExecuteParams::ExecuteOptions] Body param
      #
      # @param frame_id [String, nil] Body param: Target frame ID for the agent
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionExecuteParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Models::SessionExecuteResponse]
      #
      # @see StagehandSDK::Models::SessionExecuteParams
      def execute(id, params)
        parsed, options = StagehandSDK::SessionExecuteParams.dump_request(params)
        if parsed[:streamResponse]
          message = "Please use `#execute_streaming` for the streaming use case."
          raise ArgumentError.new(message)
        end
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/agentExecute", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: StagehandSDK::Models::SessionExecuteResponse,
          options: options
        )
      end

      # See {StagehandSDK::Resources::Sessions#execute} for non-streaming counterpart.
      #
      # Runs an autonomous AI agent that can perform complex multi-step browser tasks.
      #
      # @overload execute_streaming(id, agent_config:, execute_options:, frame_id: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param agent_config [StagehandSDK::Models::SessionExecuteParams::AgentConfig] Body param
      #
      # @param execute_options [StagehandSDK::Models::SessionExecuteParams::ExecuteOptions] Body param
      #
      # @param frame_id [String, nil] Body param: Target frame ID for the agent
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionExecuteParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Internal::Stream<StagehandSDK::Models::StreamEvent>]
      #
      # @see StagehandSDK::Models::SessionExecuteParams
      def execute_streaming(id, params)
        parsed, options = StagehandSDK::SessionExecuteParams.dump_request(params)
        unless parsed.fetch(:streamResponse, true)
          message = "Please use `#execute` for the non-streaming use case."
          raise ArgumentError.new(message)
        end
        parsed.store(:streamResponse, true)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/agentExecute", id],
          headers: {
            "accept" => "text/event-stream",
            **parsed.slice(*header_params.keys)
          }.transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          stream: StagehandSDK::Internal::Stream,
          model: StagehandSDK::StreamEvent,
          options: options
        )
      end

      # See {StagehandSDK::Resources::Sessions#extract_streaming} for streaming
      # counterpart.
      #
      # Extracts structured data from the current page using AI-powered analysis.
      #
      # @overload extract(id, frame_id: nil, instruction: nil, options: nil, schema: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param frame_id [String, nil] Body param: Target frame ID for the extraction
      #
      # @param instruction [String] Body param: Natural language instruction for what to extract
      #
      # @param options [StagehandSDK::Models::SessionExtractParams::Options] Body param
      #
      # @param schema [Hash{Symbol=>Object}] Body param: JSON Schema defining the structure of data to extract
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionExtractParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Models::SessionExtractResponse]
      #
      # @see StagehandSDK::Models::SessionExtractParams
      def extract(id, params = {})
        parsed, options = StagehandSDK::SessionExtractParams.dump_request(params)
        if parsed[:streamResponse]
          message = "Please use `#extract_streaming` for the streaming use case."
          raise ArgumentError.new(message)
        end
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/extract", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: StagehandSDK::Models::SessionExtractResponse,
          options: options
        )
      end

      # See {StagehandSDK::Resources::Sessions#extract} for non-streaming counterpart.
      #
      # Extracts structured data from the current page using AI-powered analysis.
      #
      # @overload extract_streaming(id, frame_id: nil, instruction: nil, options: nil, schema: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param frame_id [String, nil] Body param: Target frame ID for the extraction
      #
      # @param instruction [String] Body param: Natural language instruction for what to extract
      #
      # @param options [StagehandSDK::Models::SessionExtractParams::Options] Body param
      #
      # @param schema [Hash{Symbol=>Object}] Body param: JSON Schema defining the structure of data to extract
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionExtractParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Internal::Stream<StagehandSDK::Models::StreamEvent>]
      #
      # @see StagehandSDK::Models::SessionExtractParams
      def extract_streaming(id, params = {})
        parsed, options = StagehandSDK::SessionExtractParams.dump_request(params)
        unless parsed.fetch(:streamResponse, true)
          message = "Please use `#extract` for the non-streaming use case."
          raise ArgumentError.new(message)
        end
        parsed.store(:streamResponse, true)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/extract", id],
          headers: {
            "accept" => "text/event-stream",
            **parsed.slice(*header_params.keys)
          }.transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          stream: StagehandSDK::Internal::Stream,
          model: StagehandSDK::StreamEvent,
          options: options
        )
      end

      # Navigates the browser to the specified URL.
      #
      # @overload navigate(id, url:, frame_id: nil, options: nil, stream_response: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param url [String] Body param: URL to navigate to
      #
      # @param frame_id [String, nil] Body param: Target frame ID for the navigation
      #
      # @param options [StagehandSDK::Models::SessionNavigateParams::Options] Body param
      #
      # @param stream_response [Boolean] Body param: Whether to stream the response via SSE
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionNavigateParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Models::SessionNavigateResponse]
      #
      # @see StagehandSDK::Models::SessionNavigateParams
      def navigate(id, params)
        parsed, options = StagehandSDK::SessionNavigateParams.dump_request(params)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/navigate", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: StagehandSDK::Models::SessionNavigateResponse,
          options: options
        )
      end

      # See {StagehandSDK::Resources::Sessions#observe_streaming} for streaming
      # counterpart.
      #
      # Identifies and returns available actions on the current page that match the
      # given instruction.
      #
      # @overload observe(id, frame_id: nil, instruction: nil, options: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param frame_id [String, nil] Body param: Target frame ID for the observation
      #
      # @param instruction [String] Body param: Natural language instruction for what actions to find
      #
      # @param options [StagehandSDK::Models::SessionObserveParams::Options] Body param
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionObserveParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Models::SessionObserveResponse]
      #
      # @see StagehandSDK::Models::SessionObserveParams
      def observe(id, params = {})
        parsed, options = StagehandSDK::SessionObserveParams.dump_request(params)
        if parsed[:streamResponse]
          message = "Please use `#observe_streaming` for the streaming use case."
          raise ArgumentError.new(message)
        end
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/observe", id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: StagehandSDK::Models::SessionObserveResponse,
          options: options
        )
      end

      # See {StagehandSDK::Resources::Sessions#observe} for non-streaming counterpart.
      #
      # Identifies and returns available actions on the current page that match the
      # given instruction.
      #
      # @overload observe_streaming(id, frame_id: nil, instruction: nil, options: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [String] Path param: Unique session identifier
      #
      # @param frame_id [String, nil] Body param: Target frame ID for the observation
      #
      # @param instruction [String] Body param: Natural language instruction for what actions to find
      #
      # @param options [StagehandSDK::Models::SessionObserveParams::Options] Body param
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionObserveParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Internal::Stream<StagehandSDK::Models::StreamEvent>]
      #
      # @see StagehandSDK::Models::SessionObserveParams
      def observe_streaming(id, params = {})
        parsed, options = StagehandSDK::SessionObserveParams.dump_request(params)
        unless parsed.fetch(:streamResponse, true)
          message = "Please use `#observe` for the non-streaming use case."
          raise ArgumentError.new(message)
        end
        parsed.store(:streamResponse, true)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["v1/sessions/%1$s/observe", id],
          headers: {
            "accept" => "text/event-stream",
            **parsed.slice(*header_params.keys)
          }.transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          stream: StagehandSDK::Internal::Stream,
          model: StagehandSDK::StreamEvent,
          options: options
        )
      end

      # Some parameter documentations has been truncated, see
      # {StagehandSDK::Models::SessionStartParams} for more details.
      #
      # Creates a new browser session with the specified configuration. Returns a
      # session ID used for all subsequent operations.
      #
      # @overload start(model_name:, act_timeout_ms: nil, browser: nil, browserbase_session_create_params: nil, browserbase_session_id: nil, dom_settle_timeout_ms: nil, experimental: nil, self_heal: nil, system_prompt: nil, verbose: nil, wait_for_captcha_solves: nil, x_stream_response: nil, request_options: {})
      #
      # @param model_name [String] Body param: Model name to use for AI operations. Always use the format 'provider
      #
      # @param act_timeout_ms [Float] Body param: Timeout in ms for act operations (deprecated, v2 only)
      #
      # @param browser [StagehandSDK::Models::SessionStartParams::Browser] Body param
      #
      # @param browserbase_session_create_params [StagehandSDK::Models::SessionStartParams::BrowserbaseSessionCreateParams] Body param
      #
      # @param browserbase_session_id [String] Body param: Existing Browserbase session ID to resume
      #
      # @param dom_settle_timeout_ms [Float] Body param: Timeout in ms to wait for DOM to settle
      #
      # @param experimental [Boolean] Body param
      #
      # @param self_heal [Boolean] Body param: Enable self-healing for failed actions
      #
      # @param system_prompt [String] Body param: Custom system prompt for AI operations
      #
      # @param verbose [Float, StagehandSDK::Models::SessionStartParams::Verbose] Body param: Logging verbosity level (0=quiet, 1=normal, 2=debug)
      #
      # @param wait_for_captcha_solves [Boolean] Body param: Wait for captcha solves (deprecated, v2 only)
      #
      # @param x_stream_response [Symbol, StagehandSDK::Models::SessionStartParams::XStreamResponse] Header param: Whether to stream the response via SSE
      #
      # @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [StagehandSDK::Models::SessionStartResponse]
      #
      # @see StagehandSDK::Models::SessionStartParams
      def start(params)
        parsed, options = StagehandSDK::SessionStartParams.dump_request(params)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: "v1/sessions/start",
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: StagehandSDK::Models::SessionStartResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [StagehandSDK::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
