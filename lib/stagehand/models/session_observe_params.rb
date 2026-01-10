# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#observe
    #
    # @see Stagehand::Resources::Sessions#observe_streaming
    class SessionObserveParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute frame_id
      #   Target frame ID for the observation
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute instruction
      #   Natural language instruction for what actions to find
      #
      #   @return [String, nil]
      optional :instruction, String

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionObserveParams::Options, nil]
      optional :options, -> { Stagehand::SessionObserveParams::Options }

      # @!attribute x_sent_at
      #   ISO timestamp when request was sent
      #
      #   @return [Time, nil]
      optional :x_sent_at, Time

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionObserveParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionObserveParams::XStreamResponse }

      # @!method initialize(frame_id: nil, instruction: nil, options: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param frame_id [String] Target frame ID for the observation
      #
      #   @param instruction [String] Natural language instruction for what actions to find
      #
      #   @param options [Stagehand::Models::SessionObserveParams::Options]
      #
      #   @param x_sent_at [Time] ISO timestamp when request was sent
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionObserveParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute model
        #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
        #   'anthropic/claude-4.5-opus')
        #
        #   @return [String, Stagehand::Models::ModelConfig::ModelConfigObject, nil]
        optional :model, union: -> { Stagehand::ModelConfig }

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
        #   {Stagehand::Models::SessionObserveParams::Options} for more details.
        #
        #   @param model [String, Stagehand::Models::ModelConfig::ModelConfigObject] Model name string with provider prefix (e.g., 'openai/gpt-5-nano', 'anthropic/cl
        #
        #   @param selector [String] CSS selector to scope observation to a specific element
        #
        #   @param timeout [Float] Timeout in ms for the observation
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
