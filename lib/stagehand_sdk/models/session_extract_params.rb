# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#extract
    #
    # @see StagehandSDK::Resources::Sessions#extract_streaming
    class SessionExtractParams < StagehandSDK::Internal::Type::BaseModel
      extend StagehandSDK::Internal::Type::RequestParameters::Converter
      include StagehandSDK::Internal::Type::RequestParameters

      # @!attribute frame_id
      #   Target frame ID for the extraction
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute instruction
      #   Natural language instruction for what to extract
      #
      #   @return [String, nil]
      optional :instruction, String

      # @!attribute options
      #
      #   @return [StagehandSDK::Models::SessionExtractParams::Options, nil]
      optional :options, -> { StagehandSDK::SessionExtractParams::Options }

      # @!attribute schema
      #   JSON Schema defining the structure of data to extract
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :schema, StagehandSDK::Internal::Type::HashOf[StagehandSDK::Internal::Type::Unknown]

      # @!attribute x_sent_at
      #   ISO timestamp when request was sent
      #
      #   @return [Time, nil]
      optional :x_sent_at, Time

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, StagehandSDK::Models::SessionExtractParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { StagehandSDK::SessionExtractParams::XStreamResponse }

      # @!method initialize(frame_id: nil, instruction: nil, options: nil, schema: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param frame_id [String] Target frame ID for the extraction
      #
      #   @param instruction [String] Natural language instruction for what to extract
      #
      #   @param options [StagehandSDK::Models::SessionExtractParams::Options]
      #
      #   @param schema [Hash{Symbol=>Object}] JSON Schema defining the structure of data to extract
      #
      #   @param x_sent_at [Time] ISO timestamp when request was sent
      #
      #   @param x_stream_response [Symbol, StagehandSDK::Models::SessionExtractParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}]

      class Options < StagehandSDK::Internal::Type::BaseModel
        # @!attribute model
        #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
        #   'anthropic/claude-4.5-opus')
        #
        #   @return [String, StagehandSDK::Models::ModelConfig::ModelConfigObject, nil]
        optional :model, union: -> { StagehandSDK::ModelConfig }

        # @!attribute selector
        #   CSS selector to scope extraction to a specific element
        #
        #   @return [String, nil]
        optional :selector, String

        # @!attribute timeout
        #   Timeout in ms for the extraction
        #
        #   @return [Float, nil]
        optional :timeout, Float

        # @!method initialize(model: nil, selector: nil, timeout: nil)
        #   Some parameter documentations has been truncated, see
        #   {StagehandSDK::Models::SessionExtractParams::Options} for more details.
        #
        #   @param model [String, StagehandSDK::Models::ModelConfig::ModelConfigObject] Model name string with provider prefix (e.g., 'openai/gpt-5-nano', 'anthropic/cl
        #
        #   @param selector [String] CSS selector to scope extraction to a specific element
        #
        #   @param timeout [Float] Timeout in ms for the extraction
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
