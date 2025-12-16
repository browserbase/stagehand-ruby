# typed: strong

module Stagehand
  module Resources
    class Sessions
      # Performs a browser action based on natural language instruction or a specific
      # action object returned by observe().
      sig do
        params(
          session_id: String,
          input: T.any(String, Stagehand::Action::OrHash),
          frame_id: String,
          options: Stagehand::SessionActParams::Options::OrHash,
          x_stream_response:
            Stagehand::SessionActParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionActResponse)
      end
      def act(
        # Path param: The session ID returned by /sessions/start
        session_id,
        # Body param: Natural language instruction
        input:,
        # Body param: Frame ID to act on (optional)
        frame_id: nil,
        # Body param:
        options: nil,
        # Header param: Enable Server-Sent Events streaming for real-time logs
        x_stream_response: nil,
        request_options: {}
      )
      end

      # Closes the browser and cleans up all resources associated with the session.
      sig do
        params(
          session_id: String,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionEndResponse)
      end
      def end_(
        # The session ID returned by /sessions/start
        session_id,
        request_options: {}
      )
      end

      # Runs an autonomous agent that can perform multiple actions to complete a complex
      # task.
      sig do
        params(
          session_id: String,
          agent_config:
            Stagehand::SessionExecuteAgentParams::AgentConfig::OrHash,
          execute_options:
            Stagehand::SessionExecuteAgentParams::ExecuteOptions::OrHash,
          frame_id: String,
          x_stream_response:
            Stagehand::SessionExecuteAgentParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionExecuteAgentResponse)
      end
      def execute_agent(
        # Path param: The session ID returned by /sessions/start
        session_id,
        # Body param:
        agent_config:,
        # Body param:
        execute_options:,
        # Body param:
        frame_id: nil,
        # Header param: Enable Server-Sent Events streaming for real-time logs
        x_stream_response: nil,
        request_options: {}
      )
      end

      # Extracts data from the current page using natural language instructions and
      # optional JSON schema for structured output.
      sig do
        params(
          session_id: String,
          frame_id: String,
          instruction: String,
          options: Stagehand::SessionExtractParams::Options::OrHash,
          schema: T::Hash[Symbol, T.anything],
          x_stream_response:
            Stagehand::SessionExtractParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionExtractResponse::Variants)
      end
      def extract(
        # Path param: The session ID returned by /sessions/start
        session_id,
        # Body param: Frame ID to extract from
        frame_id: nil,
        # Body param: Natural language instruction for extraction
        instruction: nil,
        # Body param:
        options: nil,
        # Body param: JSON Schema for structured output
        schema: nil,
        # Header param: Enable Server-Sent Events streaming for real-time logs
        x_stream_response: nil,
        request_options: {}
      )
      end

      # Navigates the browser to the specified URL and waits for page load.
      sig do
        params(
          session_id: String,
          url: String,
          frame_id: String,
          options: Stagehand::SessionNavigateParams::Options::OrHash,
          x_stream_response:
            Stagehand::SessionNavigateParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.nilable(Stagehand::Models::SessionNavigateResponse))
      end
      def navigate(
        # Path param: The session ID returned by /sessions/start
        session_id,
        # Body param: URL to navigate to
        url:,
        # Body param:
        frame_id: nil,
        # Body param:
        options: nil,
        # Header param: Enable Server-Sent Events streaming for real-time logs
        x_stream_response: nil,
        request_options: {}
      )
      end

      # Returns a list of candidate actions that can be performed on the page,
      # optionally filtered by natural language instruction.
      sig do
        params(
          session_id: String,
          frame_id: String,
          instruction: String,
          options: Stagehand::SessionObserveParams::Options::OrHash,
          x_stream_response:
            Stagehand::SessionObserveParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T::Array[Stagehand::Action])
      end
      def observe(
        # Path param: The session ID returned by /sessions/start
        session_id,
        # Body param: Frame ID to observe
        frame_id: nil,
        # Body param: Natural language instruction to filter actions
        instruction: nil,
        # Body param:
        options: nil,
        # Header param: Enable Server-Sent Events streaming for real-time logs
        x_stream_response: nil,
        request_options: {}
      )
      end

      # Initializes a new Stagehand session with a browser instance. Returns a session
      # ID that must be used for all subsequent requests.
      sig do
        params(
          browserbase_api_key: String,
          browserbase_project_id: String,
          dom_settle_timeout: Integer,
          model: String,
          self_heal: T::Boolean,
          system_prompt: String,
          verbose: Integer,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(Stagehand::Models::SessionStartResponse)
      end
      def start(
        # API key for Browserbase Cloud
        browserbase_api_key:,
        # Project ID for Browserbase
        browserbase_project_id:,
        # Timeout in ms to wait for DOM to settle
        dom_settle_timeout: nil,
        # AI model to use for actions (must be prefixed with provider/)
        model: nil,
        # Enable self-healing for failed actions
        self_heal: nil,
        # Custom system prompt for AI actions
        system_prompt: nil,
        # Logging verbosity level
        verbose: nil,
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
