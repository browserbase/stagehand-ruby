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

      # @!attribute x_language
      #   Client SDK language
      #
      #   @return [Symbol, Stagehand::Models::SessionExecuteParams::XLanguage, nil]
      optional :x_language, enum: -> { Stagehand::SessionExecuteParams::XLanguage }

      # @!attribute x_sdk_version
      #   Version of the Stagehand SDK
      #
      #   @return [String, nil]
      optional :x_sdk_version, String

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

      # @!method initialize(agent_config:, execute_options:, frame_id: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param agent_config [Stagehand::Models::SessionExecuteParams::AgentConfig]
      #
      #   @param execute_options [Stagehand::Models::SessionExecuteParams::ExecuteOptions]
      #
      #   @param frame_id [String] Target frame ID for the agent
      #
      #   @param x_language [Symbol, Stagehand::Models::SessionExecuteParams::XLanguage] Client SDK language
      #
      #   @param x_sdk_version [String] Version of the Stagehand SDK
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

        # @!attribute system_prompt
        #   Custom system prompt for the agent
        #
        #   @return [String, nil]
        optional :system_prompt, String, api_name: :systemPrompt

        # @!method initialize(cua: nil, model: nil, system_prompt: nil)
        #   Some parameter documentations has been truncated, see
        #   {Stagehand::Models::SessionExecuteParams::AgentConfig} for more details.
        #
        #   @param cua [Boolean] Enable Computer Use Agent mode
        #
        #   @param model [String, Stagehand::Models::ModelConfig::ModelConfigObject] Model name string with provider prefix (e.g., 'openai/gpt-5-nano', 'anthropic/cl
        #
        #   @param system_prompt [String] Custom system prompt for the agent
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

      # Client SDK language
      module XLanguage
        extend Stagehand::Internal::Type::Enum

        TYPESCRIPT = :typescript
        PYTHON = :python
        PLAYGROUND = :playground

        # @!method self.values
        #   @return [Array<Symbol>]
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
