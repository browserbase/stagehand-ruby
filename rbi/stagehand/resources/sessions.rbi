# typed: strong

module Stagehand
  module Resources
    class Sessions
      # Executes a browser action using natural language instructions or a predefined
      # Action object.
      sig do
        params(
          id: T.anything,
          body: T.anything,
          x_language: T.anything,
          x_sdk_version: T.anything,
          x_sent_at: T.anything,
          x_stream_response: T.anything,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def act(
        # Path param: Unique session identifier
        id,
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

      # Terminates the browser session and releases all associated resources.
      sig do
        params(
          id: T.anything,
          x_language: T.anything,
          x_sdk_version: T.anything,
          x_sent_at: T.anything,
          x_stream_response: T.anything,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.anything)
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

      # Runs an autonomous AI agent that can perform complex multi-step browser tasks.
      sig do
        params(
          id: T.anything,
          body: T.anything,
          x_language: T.anything,
          x_sdk_version: T.anything,
          x_sent_at: T.anything,
          x_stream_response: T.anything,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def execute_agent(
        # Path param: Unique session identifier
        id,
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

      # Extracts structured data from the current page using AI-powered analysis.
      sig do
        params(
          id: T.anything,
          body: T.anything,
          x_language: T.anything,
          x_sdk_version: T.anything,
          x_sent_at: T.anything,
          x_stream_response: T.anything,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def extract(
        # Path param: Unique session identifier
        id,
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

      # Navigates the browser to the specified URL.
      sig do
        params(
          id: T.anything,
          body: T.anything,
          x_language: T.anything,
          x_sdk_version: T.anything,
          x_sent_at: T.anything,
          x_stream_response: T.anything,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def navigate(
        # Path param: Unique session identifier
        id,
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

      # Identifies and returns available actions on the current page that match the
      # given instruction.
      sig do
        params(
          id: T.anything,
          body: T.anything,
          x_language: T.anything,
          x_sdk_version: T.anything,
          x_sent_at: T.anything,
          x_stream_response: T.anything,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.anything)
      end
      def observe(
        # Path param: Unique session identifier
        id,
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
