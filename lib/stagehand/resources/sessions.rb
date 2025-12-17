# frozen_string_literal: true

module Stagehand
  module Resources
    class Sessions
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
