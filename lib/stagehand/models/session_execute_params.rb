# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#execute
    #
    # @see Stagehand::Resources::Sessions#execute_streaming
    class SessionExecuteParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute agent_config
      #
      #   @return [Stagehand::Models::SessionExecuteParams::AgentConfig]
      required :agent_config, -> { Stagehand::SessionExecuteParams::AgentConfig }, api_name: :agentConfig

      # @!attribute execute_options
      #
      #   @return [Stagehand::Models::SessionExecuteParams::ExecuteOptions]
      required :execute_options,
               -> { Stagehand::SessionExecuteParams::ExecuteOptions },
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
      #   @return [Symbol, Stagehand::Models::SessionExecuteParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionExecuteParams::XStreamResponse }

      # @!method initialize(agent_config:, execute_options:, frame_id: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param agent_config [Stagehand::Models::SessionExecuteParams::AgentConfig]
      #
      #   @param execute_options [Stagehand::Models::SessionExecuteParams::ExecuteOptions]
      #
      #   @param frame_id [String] Target frame ID for the agent
      #
      #   @param x_sent_at [Time] ISO timestamp when request was sent
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionExecuteParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class AgentConfig < Stagehand::Internal::Type::BaseModel
        # @!attribute cua
        #   Enable Computer Use Agent mode
        #
        #   @return [Boolean, nil]
        optional :cua, Stagehand::Internal::Type::Boolean

        # @!attribute model
        #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
        #   'anthropic/claude-4.5-opus')
        #
        #   @return [String, Stagehand::Models::ModelConfig::ModelConfigObject, nil]
        optional :model, union: -> { Stagehand::ModelConfig }

        # @!attribute provider
        #   AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        #
        #   @return [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Provider, nil]
        optional :provider, enum: -> { Stagehand::SessionExecuteParams::AgentConfig::Provider }

        # @!attribute system_prompt
        #   Custom system prompt for the agent
        #
        #   @return [String, nil]
        optional :system_prompt, String, api_name: :systemPrompt

        # @!method initialize(cua: nil, model: nil, provider: nil, system_prompt: nil)
        #   Some parameter documentations has been truncated, see
        #   {Stagehand::Models::SessionExecuteParams::AgentConfig} for more details.
        #
        #   @param cua [Boolean] Enable Computer Use Agent mode
        #
        #   @param model [String, Stagehand::Models::ModelConfig::ModelConfigObject] Model name string with provider prefix (e.g., 'openai/gpt-5-nano', 'anthropic/cl
        #
        #   @param provider [Symbol, Stagehand::Models::SessionExecuteParams::AgentConfig::Provider] AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        #
        #   @param system_prompt [String] Custom system prompt for the agent

        # AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        #
        # @see Stagehand::Models::SessionExecuteParams::AgentConfig#provider
        module Provider
          extend Stagehand::Internal::Type::Enum

          OPENAI = :openai
          ANTHROPIC = :anthropic
          GOOGLE = :google
          MICROSOFT = :microsoft

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class ExecuteOptions < Stagehand::Internal::Type::BaseModel
        # @!attribute instruction
        #   Natural language instruction for the agent
        #
        #   @return [String]
        required :instruction, String

        # @!attribute highlight_cursor
        #   Whether to visually highlight the cursor during execution
        #
        #   @return [Boolean, nil]
        optional :highlight_cursor, Stagehand::Internal::Type::Boolean, api_name: :highlightCursor

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
        extend Stagehand::Internal::Type::Enum

        TRUE = :true
        FALSE = :false

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
