# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#extract
    class SessionExtractParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute frame_id
      #   Frame ID to extract from
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute instruction
      #   Natural language instruction for extraction
      #
      #   @return [String, nil]
      optional :instruction, String

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionExtractParams::Options, nil]
      optional :options, -> { Stagehand::SessionExtractParams::Options }

      # @!attribute schema
      #   JSON Schema for structured output
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :schema, Stagehand::Internal::Type::HashOf[Stagehand::Internal::Type::Unknown]

      # @!attribute x_stream_response
      #
      #   @return [Symbol, Stagehand::Models::SessionExtractParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionExtractParams::XStreamResponse }

      # @!method initialize(frame_id: nil, instruction: nil, options: nil, schema: nil, x_stream_response: nil, request_options: {})
      #   @param frame_id [String] Frame ID to extract from
      #
      #   @param instruction [String] Natural language instruction for extraction
      #
      #   @param options [Stagehand::Models::SessionExtractParams::Options]
      #
      #   @param schema [Hash{Symbol=>Object}] JSON Schema for structured output
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionExtractParams::XStreamResponse]
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute model
        #
        #   @return [Stagehand::Models::ModelConfig, nil]
        optional :model, -> { Stagehand::ModelConfig }

        # @!attribute selector
        #   Extract only from elements matching this selector
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
        #   @param selector [String] Extract only from elements matching this selector
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
