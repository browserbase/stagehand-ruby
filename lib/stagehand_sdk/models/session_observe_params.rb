# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#observe
    #
    # @see StagehandSDK::Resources::Sessions#observe_streaming
    class SessionObserveParams < StagehandSDK::Internal::Type::BaseModel
      extend StagehandSDK::Internal::Type::RequestParameters::Converter
      include StagehandSDK::Internal::Type::RequestParameters

      # @!attribute frame_id
      #   Target frame ID for the observation
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId, nil?: true

      # @!attribute instruction
      #   Natural language instruction for what actions to find
      #
      #   @return [String, nil]
      optional :instruction, String

      # @!attribute options
      #
      #   @return [StagehandSDK::Models::SessionObserveParams::Options, nil]
      optional :options, -> { StagehandSDK::SessionObserveParams::Options }

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, StagehandSDK::Models::SessionObserveParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { StagehandSDK::SessionObserveParams::XStreamResponse }

      # @!method initialize(frame_id: nil, instruction: nil, options: nil, x_stream_response: nil, request_options: {})
      #   @param frame_id [String, nil] Target frame ID for the observation
      #
      #   @param instruction [String] Natural language instruction for what actions to find
      #
      #   @param options [StagehandSDK::Models::SessionObserveParams::Options]
      #
      #   @param x_stream_response [Symbol, StagehandSDK::Models::SessionObserveParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}]

      class Options < StagehandSDK::Internal::Type::BaseModel
        # @!attribute model
        #   Model name string with provider prefix. Always use the format
        #   'provider/model-name' (e.g., 'openai/gpt-4o',
        #   'anthropic/claude-sonnet-4-5-20250929', 'google/gemini-2.0-flash')
        #
        #   @return [String, StagehandSDK::Models::ModelConfig::ModelConfigObject, nil]
        optional :model, union: -> { StagehandSDK::ModelConfig }

        # @!attribute selector
        #   CSS selector to scope observation to a specific element
        #
        #   @return [String, nil]
        optional :selector, String

        # @!attribute timeout
        #   Timeout in ms for the observation
        #
        #   @return [Float, nil]
        optional :timeout, Float

        # @!method initialize(model: nil, selector: nil, timeout: nil)
        #   Some parameter documentations has been truncated, see
        #   {StagehandSDK::Models::SessionObserveParams::Options} for more details.
        #
        #   @param model [String, StagehandSDK::Models::ModelConfig::ModelConfigObject] Model name string with provider prefix. Always use the format 'provider/model-na
        #
        #   @param selector [String] CSS selector to scope observation to a specific element
        #
        #   @param timeout [Float] Timeout in ms for the observation
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
