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
      optional :frame_id, String, api_name: :frameId, nil?: true

      # @!attribute instruction
      #   Natural language instruction for what actions to find
      #
      #   @return [String, nil]
      optional :instruction, String

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionObserveParams::Options, nil]
      optional :options, -> { Stagehand::SessionObserveParams::Options }

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionObserveParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionObserveParams::XStreamResponse }

      # @!method initialize(frame_id: nil, instruction: nil, options: nil, x_stream_response: nil, request_options: {})
      #   @param frame_id [String, nil] Target frame ID for the observation
      #
      #   @param instruction [String] Natural language instruction for what actions to find
      #
      #   @param options [Stagehand::Models::SessionObserveParams::Options]
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionObserveParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute model
        #   Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        #   @return [Stagehand::Models::ModelConfig, String, nil]
        optional :model, union: -> { Stagehand::SessionObserveParams::Options::Model }

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
        #   @param model [Stagehand::Models::ModelConfig, String] Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        #   @param selector [String] CSS selector to scope observation to a specific element
        #
        #   @param timeout [Float] Timeout in ms for the observation

        # Model configuration object or model name string (e.g., 'openai/gpt-5-nano')
        #
        # @see Stagehand::Models::SessionObserveParams::Options#model
        module Model
          extend Stagehand::Internal::Type::Union

          variant -> { Stagehand::ModelConfig }

          variant String

          # @!method self.variants
          #   @return [Array(Stagehand::Models::ModelConfig, String)]
        end
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
