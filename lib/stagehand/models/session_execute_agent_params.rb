# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#execute_agent
    class SessionExecuteAgentParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute agent_config
      #
      #   @return [Stagehand::Models::SessionExecuteAgentParams::AgentConfig]
      required :agent_config, -> { Stagehand::SessionExecuteAgentParams::AgentConfig }, api_name: :agentConfig

      # @!attribute execute_options
      #
      #   @return [Stagehand::Models::SessionExecuteAgentParams::ExecuteOptions]
      required :execute_options,
               -> { Stagehand::SessionExecuteAgentParams::ExecuteOptions },
               api_name: :executeOptions

      # @!attribute frame_id
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute x_stream_response
      #
      #   @return [Symbol, Stagehand::Models::SessionExecuteAgentParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionExecuteAgentParams::XStreamResponse }

      # @!method initialize(agent_config:, execute_options:, frame_id: nil, x_stream_response: nil, request_options: {})
      #   @param agent_config [Stagehand::Models::SessionExecuteAgentParams::AgentConfig]
      #   @param execute_options [Stagehand::Models::SessionExecuteAgentParams::ExecuteOptions]
      #   @param frame_id [String]
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionExecuteAgentParams::XStreamResponse]
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class AgentConfig < Stagehand::Internal::Type::BaseModel
        # @!attribute cua
        #   Enable Computer Use Agent mode
        #
        #   @return [Boolean, nil]
        optional :cua, Stagehand::Internal::Type::Boolean

        # @!attribute model
        #
        #   @return [String, Stagehand::Models::ModelConfig, nil]
        optional :model, union: -> { Stagehand::SessionExecuteAgentParams::AgentConfig::Model }

        # @!attribute provider
        #
        #   @return [Symbol, Stagehand::Models::SessionExecuteAgentParams::AgentConfig::Provider, nil]
        optional :provider, enum: -> { Stagehand::SessionExecuteAgentParams::AgentConfig::Provider }

        # @!attribute system_prompt
        #
        #   @return [String, nil]
        optional :system_prompt, String, api_name: :systemPrompt

        # @!method initialize(cua: nil, model: nil, provider: nil, system_prompt: nil)
        #   @param cua [Boolean] Enable Computer Use Agent mode
        #
        #   @param model [String, Stagehand::Models::ModelConfig]
        #
        #   @param provider [Symbol, Stagehand::Models::SessionExecuteAgentParams::AgentConfig::Provider]
        #
        #   @param system_prompt [String]

        # @see Stagehand::Models::SessionExecuteAgentParams::AgentConfig#model
        module Model
          extend Stagehand::Internal::Type::Union

          variant String

          variant -> { Stagehand::ModelConfig }

          # @!method self.variants
          #   @return [Array(String, Stagehand::Models::ModelConfig)]
        end

        # @see Stagehand::Models::SessionExecuteAgentParams::AgentConfig#provider
        module Provider
          extend Stagehand::Internal::Type::Enum

          OPENAI = :openai
          ANTHROPIC = :anthropic
          GOOGLE = :google

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class ExecuteOptions < Stagehand::Internal::Type::BaseModel
        # @!attribute instruction
        #   Task for the agent to complete
        #
        #   @return [String]
        required :instruction, String

        # @!attribute highlight_cursor
        #   Visually highlight the cursor during actions
        #
        #   @return [Boolean, nil]
        optional :highlight_cursor, Stagehand::Internal::Type::Boolean, api_name: :highlightCursor

        # @!attribute max_steps
        #   Maximum number of steps the agent can take
        #
        #   @return [Integer, nil]
        optional :max_steps, Integer, api_name: :maxSteps

        # @!method initialize(instruction:, highlight_cursor: nil, max_steps: nil)
        #   @param instruction [String] Task for the agent to complete
        #
        #   @param highlight_cursor [Boolean] Visually highlight the cursor during actions
        #
        #   @param max_steps [Integer] Maximum number of steps the agent can take
      end

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
