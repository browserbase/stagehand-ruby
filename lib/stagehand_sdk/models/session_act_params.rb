# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#act
    #
    # @see StagehandSDK::Resources::Sessions#act_streaming
    class SessionActParams < StagehandSDK::Internal::Type::BaseModel
      extend StagehandSDK::Internal::Type::RequestParameters::Converter
      include StagehandSDK::Internal::Type::RequestParameters

      # @!attribute input
      #   Natural language instruction or Action object
      #
      #   @return [String, StagehandSDK::Models::Action]
      required :input, union: -> { StagehandSDK::SessionActParams::Input }

      # @!attribute frame_id
      #   Target frame ID for the action
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId, nil?: true

      # @!attribute options
      #
      #   @return [StagehandSDK::Models::SessionActParams::Options, nil]
      optional :options, -> { StagehandSDK::SessionActParams::Options }

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, StagehandSDK::Models::SessionActParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { StagehandSDK::SessionActParams::XStreamResponse }

      # @!method initialize(input:, frame_id: nil, options: nil, x_stream_response: nil, request_options: {})
      #   @param input [String, StagehandSDK::Models::Action] Natural language instruction or Action object
      #
      #   @param frame_id [String, nil] Target frame ID for the action
      #
      #   @param options [StagehandSDK::Models::SessionActParams::Options]
      #
      #   @param x_stream_response [Symbol, StagehandSDK::Models::SessionActParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}]

      # Natural language instruction or Action object
      module Input
        extend StagehandSDK::Internal::Type::Union

        variant String

        # Action object returned by observe and used by act
        variant -> { StagehandSDK::Action }

        # @!method self.variants
        #   @return [Array(String, StagehandSDK::Models::Action)]
      end

      class Options < StagehandSDK::Internal::Type::BaseModel
        # @!attribute model
        #   Model name string with provider prefix. Always use the format
        #   'provider/model-name' (e.g., 'openai/gpt-4o',
        #   'anthropic/claude-sonnet-4-5-20250929', 'google/gemini-2.0-flash')
        #
        #   @return [String, StagehandSDK::Models::ModelConfig::ModelConfigObject, nil]
        optional :model, union: -> { StagehandSDK::ModelConfig }

        # @!attribute timeout
        #   Timeout in ms for the action
        #
        #   @return [Float, nil]
        optional :timeout, Float

        # @!attribute variables
        #   Variables to substitute in the action instruction
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :variables, StagehandSDK::Internal::Type::HashOf[String]

        # @!method initialize(model: nil, timeout: nil, variables: nil)
        #   Some parameter documentations has been truncated, see
        #   {StagehandSDK::Models::SessionActParams::Options} for more details.
        #
        #   @param model [String, StagehandSDK::Models::ModelConfig::ModelConfigObject] Model name string with provider prefix. Always use the format 'provider/model-na
        #
        #   @param timeout [Float] Timeout in ms for the action
        #
        #   @param variables [Hash{Symbol=>String}] Variables to substitute in the action instruction
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
