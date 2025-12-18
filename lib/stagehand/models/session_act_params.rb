# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#act
    #
    # @see Stagehand::Resources::Sessions#act_streaming
    class SessionActParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute input
      #   Natural language instruction or Action object
      #
      #   @return [String, Stagehand::Models::Action]
      required :input, union: -> { Stagehand::SessionActParams::Input }

      # @!attribute frame_id
      #   Target frame ID for the action
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionActParams::Options, nil]
      optional :options, -> { Stagehand::SessionActParams::Options }

      # @!attribute x_language
      #   Client SDK language
      #
      #   @return [Symbol, Stagehand::Models::SessionActParams::XLanguage, nil]
      optional :x_language, enum: -> { Stagehand::SessionActParams::XLanguage }

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
      #   @return [Symbol, Stagehand::Models::SessionActParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionActParams::XStreamResponse }

      # @!method initialize(input:, frame_id: nil, options: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param input [String, Stagehand::Models::Action] Natural language instruction or Action object
      #
      #   @param frame_id [String] Target frame ID for the action
      #
      #   @param options [Stagehand::Models::SessionActParams::Options]
      #
      #   @param x_language [Symbol, Stagehand::Models::SessionActParams::XLanguage] Client SDK language
      #
      #   @param x_sdk_version [String] Version of the Stagehand SDK
      #
      #   @param x_sent_at [Time] ISO timestamp when request was sent
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionActParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      # Natural language instruction or Action object
      module Input
        extend Stagehand::Internal::Type::Union

        variant String

        # Action object returned by observe and used by act
        variant -> { Stagehand::Action }

        # @!method self.variants
        #   @return [Array(String, Stagehand::Models::Action)]
      end

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute model
        #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
        #   'anthropic/claude-4.5-opus')
        #
        #   @return [String, Stagehand::Models::ModelConfig::ModelConfigObject, nil]
        optional :model, union: -> { Stagehand::ModelConfig }

        # @!attribute timeout
        #   Timeout in ms for the action
        #
        #   @return [Float, nil]
        optional :timeout, Float

        # @!attribute variables
        #   Variables to substitute in the action instruction
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :variables, Stagehand::Internal::Type::HashOf[String]

        # @!method initialize(model: nil, timeout: nil, variables: nil)
        #   Some parameter documentations has been truncated, see
        #   {Stagehand::Models::SessionActParams::Options} for more details.
        #
        #   @param model [String, Stagehand::Models::ModelConfig::ModelConfigObject] Model name string with provider prefix (e.g., 'openai/gpt-5-nano', 'anthropic/cl
        #
        #   @param timeout [Float] Timeout in ms for the action
        #
        #   @param variables [Hash{Symbol=>String}] Variables to substitute in the action instruction
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
