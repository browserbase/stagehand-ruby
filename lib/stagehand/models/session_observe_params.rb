# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#observe
    class SessionObserveParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute frame_id
      #   Frame ID to observe
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute instruction
      #   Natural language instruction to filter actions
      #
      #   @return [String, nil]
      optional :instruction, String

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionObserveParams::Options, nil]
      optional :options, -> { Stagehand::SessionObserveParams::Options }

      # @!attribute x_stream_response
      #
      #   @return [Symbol, Stagehand::Models::SessionObserveParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionObserveParams::XStreamResponse }

      # @!method initialize(frame_id: nil, instruction: nil, options: nil, x_stream_response: nil, request_options: {})
      #   @param frame_id [String] Frame ID to observe
      #
      #   @param instruction [String] Natural language instruction to filter actions
      #
      #   @param options [Stagehand::Models::SessionObserveParams::Options]
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionObserveParams::XStreamResponse]
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute model
        #
        #   @return [Stagehand::Models::ModelConfig, nil]
        optional :model, -> { Stagehand::ModelConfig }

        # @!attribute selector
        #   Observe only elements matching this selector
        #
        #   @return [String, nil]
        optional :selector, String

        # @!attribute timeout
        #
        #   @return [Integer, nil]
        optional :timeout, Integer

        # @!method initialize(model: nil, selector: nil, timeout: nil)
        #   @param model [Stagehand::Models::ModelConfig]
        #
        #   @param selector [String] Observe only elements matching this selector
        #
        #   @param timeout [Integer]
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
