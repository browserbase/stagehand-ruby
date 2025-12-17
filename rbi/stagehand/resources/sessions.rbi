# typed: strong

module Stagehand
  module Resources
    class Sessions
      # Creates a new browser session with the specified configuration. Returns a
      # session ID used for all subsequent operations.
      sig do
        params(
          body: T.anything,
          x_language: T.anything,
          x_sdk_version: T.anything,
          x_sent_at: T.anything,
          x_stream_response: T.anything,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def start(
        # Body param:
        body: nil,
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
