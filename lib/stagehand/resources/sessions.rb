# frozen_string_literal: true

module Stagehand
  module Resources
    class Sessions
      # Executes a browser action using natural language instructions or a predefined
      # Action object.
      #
      # @overload act(id, body: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [Object] Path param: Unique session identifier
      #
      # @param body [Object] Body param:
      #
      # @param x_language [Object] Header param: Client SDK language
      #
      # @param x_sdk_version [Object] Header param: Version of the Stagehand SDK
      #
      # @param x_sent_at [Object] Header param: ISO timestamp when request was sent
      #
      # @param x_stream_response [Object] Header param: Whether to stream the response via SSE
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Stagehand::Models::SessionActParams
      def act(id, params = {})
        parsed, options = Stagehand::SessionActParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["sessions/%1$s/act", id],
          headers: parsed.except(:body).transform_keys(
            x_language: "x-language",
            x_sdk_version: "x-sdk-version",
            x_sent_at: "x-sent-at",
            x_stream_response: "x-stream-response"
          ),
          body: parsed[:body],
          model: Stagehand::Internal::Type::Unknown,
          options: options
        )
      end

      # Terminates the browser session and releases all associated resources.
      #
      # @overload end_(id, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [Object] Unique session identifier
      #
      # @param x_language [Object] Client SDK language
      #
      # @param x_sdk_version [Object] Version of the Stagehand SDK
      #
      # @param x_sent_at [Object] ISO timestamp when request was sent
      #
      # @param x_stream_response [Object] Whether to stream the response via SSE
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Stagehand::Models::SessionEndParams
      def end_(id, params = {})
        parsed, options = Stagehand::SessionEndParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["sessions/%1$s/end", id],
          headers: parsed.transform_keys(
            x_language: "x-language",
            x_sdk_version: "x-sdk-version",
            x_sent_at: "x-sent-at",
            x_stream_response: "x-stream-response"
          ),
          model: Stagehand::Internal::Type::Unknown,
          options: options
        )
      end

      # Runs an autonomous AI agent that can perform complex multi-step browser tasks.
      #
      # @overload execute_agent(id, body: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [Object] Path param: Unique session identifier
      #
      # @param body [Object] Body param:
      #
      # @param x_language [Object] Header param: Client SDK language
      #
      # @param x_sdk_version [Object] Header param: Version of the Stagehand SDK
      #
      # @param x_sent_at [Object] Header param: ISO timestamp when request was sent
      #
      # @param x_stream_response [Object] Header param: Whether to stream the response via SSE
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Stagehand::Models::SessionExecuteAgentParams
      def execute_agent(id, params = {})
        parsed, options = Stagehand::SessionExecuteAgentParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["sessions/%1$s/agentExecute", id],
          headers: parsed.except(:body).transform_keys(
            x_language: "x-language",
            x_sdk_version: "x-sdk-version",
            x_sent_at: "x-sent-at",
            x_stream_response: "x-stream-response"
          ),
          body: parsed[:body],
          model: Stagehand::Internal::Type::Unknown,
          options: options
        )
      end

      # Extracts structured data from the current page using AI-powered analysis.
      #
      # @overload extract(id, body: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [Object] Path param: Unique session identifier
      #
      # @param body [Object] Body param:
      #
      # @param x_language [Object] Header param: Client SDK language
      #
      # @param x_sdk_version [Object] Header param: Version of the Stagehand SDK
      #
      # @param x_sent_at [Object] Header param: ISO timestamp when request was sent
      #
      # @param x_stream_response [Object] Header param: Whether to stream the response via SSE
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Stagehand::Models::SessionExtractParams
      def extract(id, params = {})
        parsed, options = Stagehand::SessionExtractParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["sessions/%1$s/extract", id],
          headers: parsed.except(:body).transform_keys(
            x_language: "x-language",
            x_sdk_version: "x-sdk-version",
            x_sent_at: "x-sent-at",
            x_stream_response: "x-stream-response"
          ),
          body: parsed[:body],
          model: Stagehand::Internal::Type::Unknown,
          options: options
        )
      end

      # Navigates the browser to the specified URL.
      #
      # @overload navigate(id, body: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [Object] Path param: Unique session identifier
      #
      # @param body [Object] Body param:
      #
      # @param x_language [Object] Header param: Client SDK language
      #
      # @param x_sdk_version [Object] Header param: Version of the Stagehand SDK
      #
      # @param x_sent_at [Object] Header param: ISO timestamp when request was sent
      #
      # @param x_stream_response [Object] Header param: Whether to stream the response via SSE
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Stagehand::Models::SessionNavigateParams
      def navigate(id, params = {})
        parsed, options = Stagehand::SessionNavigateParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["sessions/%1$s/navigate", id],
          headers: parsed.except(:body).transform_keys(
            x_language: "x-language",
            x_sdk_version: "x-sdk-version",
            x_sent_at: "x-sent-at",
            x_stream_response: "x-stream-response"
          ),
          body: parsed[:body],
          model: Stagehand::Internal::Type::Unknown,
          options: options
        )
      end

      # Identifies and returns available actions on the current page that match the
      # given instruction.
      #
      # @overload observe(id, body: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #
      # @param id [Object] Path param: Unique session identifier
      #
      # @param body [Object] Body param:
      #
      # @param x_language [Object] Header param: Client SDK language
      #
      # @param x_sdk_version [Object] Header param: Version of the Stagehand SDK
      #
      # @param x_sent_at [Object] Header param: ISO timestamp when request was sent
      #
      # @param x_stream_response [Object] Header param: Whether to stream the response via SSE
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Stagehand::Models::SessionObserveParams
      def observe(id, params = {})
        parsed, options = Stagehand::SessionObserveParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["sessions/%1$s/observe", id],
          headers: parsed.except(:body).transform_keys(
            x_language: "x-language",
            x_sdk_version: "x-sdk-version",
            x_sent_at: "x-sent-at",
            x_stream_response: "x-stream-response"
          ),
          body: parsed[:body],
          model: Stagehand::Internal::Type::Unknown,
          options: options
        )
      end

      # Creates a new browser session with the specified configuration. Returns a
      # session ID used for all subsequent operations.
      #
      # @overload start(body: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #
      # @param body [Object] Body param:
      #
      # @param x_language [Object] Header param: Client SDK language
      #
      # @param x_sdk_version [Object] Header param: Version of the Stagehand SDK
      #
      # @param x_sent_at [Object] Header param: ISO timestamp when request was sent
      #
      # @param x_stream_response [Object] Header param: Whether to stream the response via SSE
      #
      # @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Object]
      #
      # @see Stagehand::Models::SessionStartParams
      def start(params = {})
        parsed, options = Stagehand::SessionStartParams.dump_request(params)
        @client.request(
          method: :post,
          path: "sessions/start",
          headers: parsed.except(:body).transform_keys(
            x_language: "x-language",
            x_sdk_version: "x-sdk-version",
            x_sent_at: "x-sent-at",
            x_stream_response: "x-stream-response"
          ),
          body: parsed[:body],
          model: Stagehand::Internal::Type::Unknown,
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
