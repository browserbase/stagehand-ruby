# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#execute
    #
    # @see StagehandSDK::Resources::Sessions#execute_streaming
    class SessionExecuteParams < StagehandSDK::Internal::Type::BaseModel
      extend StagehandSDK::Internal::Type::RequestParameters::Converter
      include StagehandSDK::Internal::Type::RequestParameters

      # @!attribute agent_config
      #
      #   @return [StagehandSDK::Models::SessionExecuteParams::AgentConfig]
      required :agent_config, -> { StagehandSDK::SessionExecuteParams::AgentConfig }, api_name: :agentConfig

      # @!attribute execute_options
      #
      #   @return [StagehandSDK::Models::SessionExecuteParams::ExecuteOptions]
      required :execute_options,
               -> { StagehandSDK::SessionExecuteParams::ExecuteOptions },
               api_name: :executeOptions

      # @!attribute frame_id
      #   Target frame ID for the agent
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute x_sent_at
      #   ISO timestamp when request was sent
      #
      #   @return [Time, nil]
      optional :x_sent_at, Time

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, StagehandSDK::Models::SessionExecuteParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { StagehandSDK::SessionExecuteParams::XStreamResponse }

      # @!method initialize(agent_config:, execute_options:, frame_id: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param agent_config [StagehandSDK::Models::SessionExecuteParams::AgentConfig]
      #
      #   @param execute_options [StagehandSDK::Models::SessionExecuteParams::ExecuteOptions]
      #
      #   @param frame_id [String] Target frame ID for the agent
      #
      #   @param x_sent_at [Time] ISO timestamp when request was sent
      #
      #   @param x_stream_response [Symbol, StagehandSDK::Models::SessionExecuteParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}]

      class AgentConfig < StagehandSDK::Internal::Type::BaseModel
        # @!attribute cua
        #   Enable Computer Use Agent mode
        #
        #   @return [Boolean, nil]
        optional :cua, StagehandSDK::Internal::Type::Boolean

        # @!attribute model
        #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
        #   'anthropic/claude-4.5-opus')
        #
        #   @return [String, StagehandSDK::Models::ModelConfig::ModelConfigObject, nil]
        optional :model, union: -> { StagehandSDK::ModelConfig }

        # @!attribute provider
        #   AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        #
        #   @return [Symbol, StagehandSDK::Models::SessionExecuteParams::AgentConfig::Provider, nil]
        optional :provider, enum: -> { StagehandSDK::SessionExecuteParams::AgentConfig::Provider }

        # @!attribute system_prompt
        #   Custom system prompt for the agent
        #
        #   @return [String, nil]
        optional :system_prompt, String, api_name: :systemPrompt

        # @!method initialize(cua: nil, model: nil, provider: nil, system_prompt: nil)
        #   Some parameter documentations has been truncated, see
        #   {StagehandSDK::Models::SessionExecuteParams::AgentConfig} for more details.
        #
        #   @param cua [Boolean] Enable Computer Use Agent mode
        #
        #   @param model [String, StagehandSDK::Models::ModelConfig::ModelConfigObject] Model name string with provider prefix (e.g., 'openai/gpt-5-nano', 'anthropic/cl
        #
        #   @param provider [Symbol, StagehandSDK::Models::SessionExecuteParams::AgentConfig::Provider] AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        #
        #   @param system_prompt [String] Custom system prompt for the agent

        # AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        #
        # @see StagehandSDK::Models::SessionExecuteParams::AgentConfig#provider
        module Provider
          extend StagehandSDK::Internal::Type::Enum

          OPENAI = :openai
          ANTHROPIC = :anthropic
          GOOGLE = :google
          MICROSOFT = :microsoft

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class ExecuteOptions < StagehandSDK::Internal::Type::BaseModel
        # @!attribute instruction
        #   Natural language instruction for the agent
        #
        #   @return [String]
        required :instruction, String

        # @!attribute highlight_cursor
        #   Whether to visually highlight the cursor during execution
        #
        #   @return [Boolean, nil]
        optional :highlight_cursor, StagehandSDK::Internal::Type::Boolean, api_name: :highlightCursor

        # @!attribute max_steps
        #   Maximum number of steps the agent can take
        #
        #   @return [Float, nil]
        optional :max_steps, Float, api_name: :maxSteps

        # @!method initialize(instruction:, highlight_cursor: nil, max_steps: nil)
        #   @param instruction [String] Natural language instruction for the agent
        #
        #   @param highlight_cursor [Boolean] Whether to visually highlight the cursor during execution
        #
        #   @param max_steps [Float] Maximum number of steps the agent can take
      end

      # Whether to stream the response via SSE
      module XStreamResponse
        extend StagehandSDK::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
