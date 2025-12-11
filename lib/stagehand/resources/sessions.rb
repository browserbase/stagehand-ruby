# frozen_string_literal: true

module Stagehand
  module Resources
    class Sessions
      # Performs a browser action based on natural language instruction or a specific
      # action object returned by observe().
      #
      # @overload act(session_id, input:, frame_id: nil, options: nil, x_stream_response: nil, request_options: {})
      #
      # @param session_id [String] Path param: The session ID returned by /sessions/start
      #
      # @param input [String, Stagehand::Models::Action] Body param: Natural language instruction
      #
      # @param frame_id [String] Body param: Frame ID to act on (optional)
      #
      # @param options [Stagehand::Models::SessionActParams::Options] Body param:
      #
      # @param x_stream_response [Symbol, Stagehand::Models::SessionActParams::XStreamResponse] Header param: Enable Server-Sent Events streaming for real-time logs
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Stagehand::Models::SessionActResponse]
      #
      # @see Stagehand::Models::SessionActParams
      def act(session_id, params)
        parsed, options = Stagehand::SessionActParams.dump_request(params)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["sessions/%1$s/act", session_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Stagehand::Models::SessionActResponse,
          options: options
        )
      end

      # Closes the browser and cleans up all resources associated with the session.
      #
      # @overload end_(session_id, request_options: {})
      #
      # @param session_id [String] The session ID returned by /sessions/start
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Stagehand::Models::SessionEndResponse]
      #
      # @see Stagehand::Models::SessionEndParams
      def end_(session_id, params = {})
        @client.request(
          method: :post,
          path: ["sessions/%1$s/end", session_id],
          model: Stagehand::Models::SessionEndResponse,
          options: params[:request_options]
        )
      end

      # Runs an autonomous agent that can perform multiple actions to complete a complex
      # task.
      #
      # @overload execute_agent(session_id, agent_config:, execute_options:, frame_id: nil, x_stream_response: nil, request_options: {})
      #
      # @param session_id [String] Path param: The session ID returned by /sessions/start
      #
      # @param agent_config [Stagehand::Models::SessionExecuteAgentParams::AgentConfig] Body param:
      #
      # @param execute_options [Stagehand::Models::SessionExecuteAgentParams::ExecuteOptions] Body param:
      #
      # @param frame_id [String] Body param:
      #
      # @param x_stream_response [Symbol, Stagehand::Models::SessionExecuteAgentParams::XStreamResponse] Header param: Enable Server-Sent Events streaming for real-time logs
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Stagehand::Models::SessionExecuteAgentResponse]
      #
      # @see Stagehand::Models::SessionExecuteAgentParams
      def execute_agent(session_id, params)
        parsed, options = Stagehand::SessionExecuteAgentParams.dump_request(params)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["sessions/%1$s/agentExecute", session_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Stagehand::Models::SessionExecuteAgentResponse,
          options: options
        )
      end

      # Extracts data from the current page using natural language instructions and
      # optional JSON schema for structured output.
      #
      # @overload extract(session_id, frame_id: nil, instruction: nil, options: nil, schema: nil, x_stream_response: nil, request_options: {})
      #
      # @param session_id [String] Path param: The session ID returned by /sessions/start
      #
      # @param frame_id [String] Body param: Frame ID to extract from
      #
      # @param instruction [String] Body param: Natural language instruction for extraction
      #
      # @param options [Stagehand::Models::SessionExtractParams::Options] Body param:
      #
      # @param schema [Hash{Symbol=>Object}] Body param: JSON Schema for structured output
      #
      # @param x_stream_response [Symbol, Stagehand::Models::SessionExtractParams::XStreamResponse] Header param: Enable Server-Sent Events streaming for real-time logs
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Stagehand::Models::SessionExtractResponse::Extraction, Hash{Symbol=>Object}]
      #
      # @see Stagehand::Models::SessionExtractParams
      def extract(session_id, params = {})
        parsed, options = Stagehand::SessionExtractParams.dump_request(params)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["sessions/%1$s/extract", session_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Stagehand::Models::SessionExtractResponse,
          options: options
        )
      end

      # Navigates the browser to the specified URL and waits for page load.
      #
      # @overload navigate(session_id, url:, frame_id: nil, options: nil, x_stream_response: nil, request_options: {})
      #
      # @param session_id [String] Path param: The session ID returned by /sessions/start
      #
      # @param url [String] Body param: URL to navigate to
      #
      # @param frame_id [String] Body param:
      #
      # @param options [Stagehand::Models::SessionNavigateParams::Options] Body param:
      #
      # @param x_stream_response [Symbol, Stagehand::Models::SessionNavigateParams::XStreamResponse] Header param: Enable Server-Sent Events streaming for real-time logs
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Stagehand::Models::SessionNavigateResponse, nil]
      #
      # @see Stagehand::Models::SessionNavigateParams
      def navigate(session_id, params)
        parsed, options = Stagehand::SessionNavigateParams.dump_request(params)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["sessions/%1$s/navigate", session_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Stagehand::Models::SessionNavigateResponse,
          options: options
        )
      end

      # Returns a list of candidate actions that can be performed on the page,
      # optionally filtered by natural language instruction.
      #
      # @overload observe(session_id, frame_id: nil, instruction: nil, options: nil, x_stream_response: nil, request_options: {})
      #
      # @param session_id [String] Path param: The session ID returned by /sessions/start
      #
      # @param frame_id [String] Body param: Frame ID to observe
      #
      # @param instruction [String] Body param: Natural language instruction to filter actions
      #
      # @param options [Stagehand::Models::SessionObserveParams::Options] Body param:
      #
      # @param x_stream_response [Symbol, Stagehand::Models::SessionObserveParams::XStreamResponse] Header param: Enable Server-Sent Events streaming for real-time logs
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Array<Stagehand::Models::Action>]
      #
      # @see Stagehand::Models::SessionObserveParams
      def observe(session_id, params = {})
        parsed, options = Stagehand::SessionObserveParams.dump_request(params)
        header_params = {x_stream_response: "x-stream-response"}
        @client.request(
          method: :post,
          path: ["sessions/%1$s/observe", session_id],
          headers: parsed.slice(*header_params.keys).transform_keys(header_params),
          body: parsed.except(*header_params.keys),
          model: Stagehand::Internal::Type::ArrayOf[Stagehand::Action],
          options: options
        )
      end

      # Initializes a new Stagehand session with a browser instance. Returns a session
      # ID that must be used for all subsequent requests.
      #
      # @overload start(env:, api_key: nil, dom_settle_timeout: nil, local_browser_launch_options: nil, model: nil, project_id: nil, self_heal: nil, system_prompt: nil, verbose: nil, request_options: {})
      #
      # @param env [Symbol, Stagehand::Models::SessionStartParams::Env] Environment to run the browser in
      #
      # @param api_key [String] API key for Browserbase (required when env=BROWSERBASE)
      #
      # @param dom_settle_timeout [Integer] Timeout in ms to wait for DOM to settle
      #
      # @param local_browser_launch_options [Stagehand::Models::SessionStartParams::LocalBrowserLaunchOptions] Options for local browser launch
      #
      # @param model [String] AI model to use for actions
      #
      # @param project_id [String] Project ID for Browserbase (required when env=BROWSERBASE)
      #
      # @param self_heal [Boolean] Enable self-healing for failed actions
      #
      # @param system_prompt [String] Custom system prompt for AI actions
      #
      # @param verbose [Integer] Logging verbosity level
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Stagehand::Models::SessionStartResponse]
      #
      # @see Stagehand::Models::SessionStartParams
      def start(params)
        parsed, options = Stagehand::SessionStartParams.dump_request(params)
        @client.request(
          method: :post,
          path: "sessions/start",
          body: parsed,
          model: Stagehand::Models::SessionStartResponse,
          options: options
        )
      end

      # @api private
      #
      # @param client [Stagehand::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
