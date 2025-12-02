# frozen_string_literal: true

require "json"

module Stagehand
  module Resources
    # Sessions resource for managing Stagehand browser sessions
    #
    # This is the main resource for interacting with the Stagehand API.
    # All browser automation happens within the context of a session.
    class Sessions
      def initialize(http_client)
        @http = http_client
      end

      # Start a new browser session
      #
      # @param env [Symbol] Environment to run in (:LOCAL or :BROWSERBASE)
      # @param api_key [String, nil] API key for Browserbase
      # @param project_id [String, nil] Project ID for Browserbase
      # @param model [String, Hash, nil] AI model to use
      # @param system_prompt [String, nil] Custom system prompt
      # @param self_heal [Boolean, nil] Enable self-healing for failed actions
      # @param dom_settle_timeout [Integer, nil] Timeout in ms for DOM to settle
      # @param verbose [Integer, nil] Logging verbosity (0-2)
      # @param local_browser_launch_options [Hash, nil] Options for local browser
      # @param stream [Boolean] Whether to stream responses
      # @yield [Hash] SSE events if streaming
      # @return [Types::SessionStartResponse]
      def start(
        env:,
        api_key: nil,
        project_id: nil,
        model: nil,
        system_prompt: nil,
        self_heal: nil,
        dom_settle_timeout: nil,
        verbose: nil,
        local_browser_launch_options: nil,
        browserbase_session_id: nil,
        browserbase_session_create_params: nil,
        stream: false,
        &block
      )
        body = { env: env.to_s }
        body[:apiKey] = api_key if api_key
        body[:projectId] = project_id if project_id
        body[:model] = normalize_model(model) if model
        body[:systemPrompt] = system_prompt if system_prompt
        body[:selfHeal] = self_heal unless self_heal.nil?
        body[:domSettleTimeout] = dom_settle_timeout if dom_settle_timeout
        body[:verbose] = verbose if verbose
        body[:localBrowserLaunchOptions] = camelize_keys(local_browser_launch_options) if local_browser_launch_options
        body[:browserbaseSessionId] = browserbase_session_id if browserbase_session_id
        body[:browserbaseSessionCreateParams] = browserbase_session_create_params if browserbase_session_create_params

        if stream && block_given?
          result = nil
          @http.post("/sessions/start", body, stream: true) do |event|
            if event[:type] == "result" || event[:sessionId]
              result = Types::SessionStartResponse.new(event[:data] || event)
            else
              block.call(event)
            end
          end
          result || Types::SessionStartResponse.new({})
        else
          response = @http.post("/sessions/start", body)
          Types::SessionStartResponse.new(response)
        end
      end

      # Perform a browser action
      #
      # @param session_id [String] Session UUID
      # @param input [String, Hash] Natural language instruction or Action object
      # @param frame_id [String, nil] Frame ID to act on
      # @param options [Hash] Additional options
      # @option options [Hash, String] :model Model configuration
      # @option options [Integer] :timeout Timeout in milliseconds
      # @option options [Hash] :variables Template variables
      # @param stream [Boolean] Whether to stream responses
      # @yield [Hash] SSE events if streaming
      # @return [Types::SessionActResponse]
      def act(session_id, input:, frame_id: nil, options: {}, stream: false, &block)
        body = {}
        body[:input] = input
        body[:frameId] = frame_id if frame_id

        if options.any?
          opts = {}
          opts[:model] = normalize_model(options[:model]) if options[:model]
          opts[:timeout] = options[:timeout] if options[:timeout]
          opts[:variables] = options[:variables] if options[:variables]
          body[:options] = opts if opts.any?
        end

        if stream && block_given?
          result = nil
          @http.post("/sessions/#{session_id}/act", body, stream: true) do |event|
            if event[:type] == "result" || event[:success]
              result = Types::SessionActResponse.new(event[:data] || event)
            else
              block.call(event)
            end
          end
          result || Types::SessionActResponse.new({})
        else
          response = @http.post("/sessions/#{session_id}/act", body)
          Types::SessionActResponse.new(response)
        end
      end

      # Extract data from the page
      #
      # @param session_id [String] Session UUID
      # @param instruction [String, nil] Natural language instruction
      # @param frame_id [String, nil] Frame ID to extract from
      # @param options [Hash] Additional options
      # @option options [Hash, String] :model Model configuration
      # @option options [Integer] :timeout Timeout in milliseconds
      # @option options [String] :selector CSS selector to extract from
      # @option options [Hash] :schema JSON Schema for structured output
      # @param stream [Boolean] Whether to stream responses
      # @yield [Hash] SSE events if streaming
      # @return [Types::SessionExtractResponse, Hash]
      def extract(session_id, instruction: nil, frame_id: nil, options: {}, stream: false, &block)
        body = {}
        body[:instruction] = instruction if instruction
        body[:frameId] = frame_id if frame_id

        if options.any?
          opts = {}
          opts[:model] = normalize_model(options[:model]) if options[:model]
          opts[:timeout] = options[:timeout] if options[:timeout]
          opts[:selector] = options[:selector] if options[:selector]
          opts[:schema] = options[:schema] if options[:schema]
          body[:options] = opts if opts.any?
        end

        if stream && block_given?
          result = nil
          @http.post("/sessions/#{session_id}/extract", body, stream: true) do |event|
            if event[:type] == "result" || event[:extraction]
              result = Types::SessionExtractResponse.new(event[:data] || event)
            else
              block.call(event)
            end
          end
          result || Types::SessionExtractResponse.new({})
        else
          response = @http.post("/sessions/#{session_id}/extract", body)
          # If schema was provided, return raw hash for flexible access
          options[:schema] ? response : Types::SessionExtractResponse.new(response)
        end
      end

      # Observe actionable elements on the page
      #
      # @param session_id [String] Session UUID
      # @param instruction [String, nil] Natural language instruction to filter
      # @param frame_id [String, nil] Frame ID to observe
      # @param options [Hash] Additional options
      # @option options [Hash, String] :model Model configuration
      # @option options [Integer] :timeout Timeout in milliseconds
      # @option options [String] :selector CSS selector to observe
      # @param stream [Boolean] Whether to stream responses
      # @yield [Hash] SSE events if streaming
      # @return [Types::SessionObserveResponse]
      def observe(session_id, instruction: nil, frame_id: nil, options: {}, stream: false, &block)
        body = {}
        body[:instruction] = instruction if instruction
        body[:frameId] = frame_id if frame_id

        if options.any?
          opts = {}
          opts[:model] = normalize_model(options[:model]) if options[:model]
          opts[:timeout] = options[:timeout] if options[:timeout]
          opts[:selector] = options[:selector] if options[:selector]
          body[:options] = opts if opts.any?
        end

        if stream && block_given?
          result = nil
          @http.post("/sessions/#{session_id}/observe", body, stream: true) do |event|
            if event[:type] == "result" || event.is_a?(Array)
              data = event[:data] || event
              result = Types::SessionObserveResponse.new(data)
            else
              block.call(event)
            end
          end
          result || Types::SessionObserveResponse.new([])
        else
          response = @http.post("/sessions/#{session_id}/observe", body)
          Types::SessionObserveResponse.new(response)
        end
      end

      # Execute an autonomous agent
      #
      # @param session_id [String] Session UUID
      # @param execute_options [Hash] Agent execution options
      # @option execute_options [String] :instruction Task for the agent
      # @option execute_options [Integer] :max_steps Maximum steps
      # @option execute_options [Boolean] :highlight_cursor Highlight cursor
      # @param agent_config [Hash] Agent configuration
      # @option agent_config [String, Hash] :model AI model
      # @option agent_config [Symbol] :provider AI provider
      # @option agent_config [String] :system_prompt Custom system prompt
      # @option agent_config [Boolean] :cua Enable Computer Use Agent mode
      # @param frame_id [String, nil] Frame ID
      # @param stream [Boolean] Whether to stream responses
      # @yield [Hash] SSE events if streaming
      # @return [Types::SessionExecuteAgentResponse]
      def execute_agent(session_id, execute_options:, agent_config: {}, frame_id: nil, stream: false, &block)
        body = {
          executeOptions: camelize_keys(execute_options)
        }
        body[:agentConfig] = camelize_keys(agent_config) if agent_config.any?
        body[:agentConfig][:model] = normalize_model(agent_config[:model]) if agent_config[:model]
        body[:frameId] = frame_id if frame_id

        if stream && block_given?
          result = nil
          @http.post("/sessions/#{session_id}/agentExecute", body, stream: true) do |event|
            if event[:type] == "result" || event[:message]
              result = Types::SessionExecuteAgentResponse.new(event[:data] || event)
            else
              block.call(event)
            end
          end
          result || Types::SessionExecuteAgentResponse.new({})
        else
          response = @http.post("/sessions/#{session_id}/agentExecute", body)
          Types::SessionExecuteAgentResponse.new(response)
        end
      end

      # Navigate to a URL
      #
      # @param session_id [String] Session UUID
      # @param url [String] URL to navigate to
      # @param frame_id [String, nil] Frame ID
      # @param options [Hash] Navigation options
      # @option options [Symbol] :wait_until When to consider navigation complete
      # @param stream [Boolean] Whether to stream responses
      # @yield [Hash] SSE events if streaming
      # @return [Types::SessionNavigateResponse]
      def navigate(session_id, url:, frame_id: nil, options: {}, stream: false, &block)
        body = { url: url }
        body[:frameId] = frame_id if frame_id

        if options.any?
          opts = {}
          opts[:waitUntil] = options[:wait_until] if options[:wait_until]
          body[:options] = opts if opts.any?
        end

        if stream && block_given?
          result = nil
          @http.post("/sessions/#{session_id}/navigate", body, stream: true) do |event|
            if event[:type] == "result" || event[:ok]
              result = Types::SessionNavigateResponse.new(event[:data] || event)
            else
              block.call(event)
            end
          end
          result || Types::SessionNavigateResponse.new({})
        else
          response = @http.post("/sessions/#{session_id}/navigate", body)
          Types::SessionNavigateResponse.new(response)
        end
      end

      # End a session
      #
      # @param session_id [String] Session UUID
      # @return [Types::SessionEndResponse]
      def end_(session_id)
        response = @http.post("/sessions/#{session_id}/end", {})
        Types::SessionEndResponse.new(response)
      end

      private

      def normalize_model(model)
        return model if model.is_a?(String)
        return model.to_h if model.is_a?(Types::ModelConfig)

        camelize_keys(model) if model.is_a?(Hash)
      end

      def camelize_keys(hash)
        return hash unless hash.is_a?(Hash)

        hash.transform_keys do |key|
          key.to_s.gsub(/_([a-z])/) { ::Regexp.last_match(1).upcase }.to_sym
        end
      end
    end
  end
end
