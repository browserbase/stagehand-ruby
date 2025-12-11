# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#act
    class SessionActParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute input
      #   Natural language instruction
      #
      #   @return [String, Stagehand::Models::Action]
      required :input, union: -> { Stagehand::SessionActParams::Input }

      # @!attribute frame_id
      #   Frame ID to act on (optional)
      #
      #   @return [String, nil]
      optional :frame_id, String, api_name: :frameId

      # @!attribute options
      #
      #   @return [Stagehand::Models::SessionActParams::Options, nil]
      optional :options, -> { Stagehand::SessionActParams::Options }

      # @!attribute x_stream_response
      #
      #   @return [Symbol, Stagehand::Models::SessionActParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionActParams::XStreamResponse }

      # @!method initialize(input:, frame_id: nil, options: nil, x_stream_response: nil, request_options: {})
      #   @param input [String, Stagehand::Models::Action] Natural language instruction
      #
      #   @param frame_id [String] Frame ID to act on (optional)
      #
      #   @param options [Stagehand::Models::SessionActParams::Options]
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionActParams::XStreamResponse]
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      # Natural language instruction
      module Input
        extend Stagehand::Internal::Type::Union

        # Natural language instruction
        variant String

        variant -> { Stagehand::Action }

        # @!method self.variants
        #   @return [Array(String, Stagehand::Models::Action)]
      end

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute model
        #
        #   @return [Stagehand::Models::ModelConfig, nil]
        optional :model, -> { Stagehand::ModelConfig }

        # @!attribute timeout
        #   Timeout in milliseconds
        #
        #   @return [Integer, nil]
        optional :timeout, Integer

        # @!attribute variables
        #   Template variables for instruction
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :variables, Stagehand::Internal::Type::HashOf[String]

        # @!method initialize(model: nil, timeout: nil, variables: nil)
        #   @param model [Stagehand::Models::ModelConfig]
        #
        #   @param timeout [Integer] Timeout in milliseconds
        #
        #   @param variables [Hash{Symbol=>String}] Template variables for instruction
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
