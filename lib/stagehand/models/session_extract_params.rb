# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#extract
    class SessionExtractParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

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
      #   @return [Stagehand::Models::SessionExtractParams::Options, nil]
      optional :options, -> { Stagehand::SessionExtractParams::Options }

      # @!attribute schema
      #   JSON Schema defining the structure of data to extract
      #
      #   @return [Hash{Symbol=>Object}, nil]
      optional :schema, Stagehand::Internal::Type::HashOf[Stagehand::Internal::Type::Unknown]

      # @!attribute x_language
      #   Client SDK language
      #
      #   @return [Symbol, Stagehand::Models::SessionExtractParams::XLanguage, nil]
      optional :x_language, enum: -> { Stagehand::SessionExtractParams::XLanguage }

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
      #   @return [Symbol, Stagehand::Models::SessionExtractParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionExtractParams::XStreamResponse }

      # @!method initialize(frame_id: nil, instruction: nil, options: nil, schema: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param frame_id [String] Target frame ID for the extraction
      #
      #   @param instruction [String] Natural language instruction for what to extract
      #
      #   @param options [Stagehand::Models::SessionExtractParams::Options]
      #
      #   @param schema [Hash{Symbol=>Object}] JSON Schema defining the structure of data to extract
      #
      #   @param x_language [Symbol, Stagehand::Models::SessionExtractParams::XLanguage] Client SDK language
      #
      #   @param x_sdk_version [String] Version of the Stagehand SDK
      #
      #   @param x_sent_at [Time] ISO timestamp when request was sent
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionExtractParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      class Options < Stagehand::Internal::Type::BaseModel
        # @!attribute model
        #
        #   @return [String, Stagehand::Models::ModelConfig::UnionMember1, nil]
        optional :model, union: -> { Stagehand::ModelConfig }

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
        #   @param model [String, Stagehand::Models::ModelConfig::UnionMember1]
        #
        #   @param selector [String] CSS selector to scope extraction to a specific element
        #
        #   @param timeout [Float] Timeout in ms for the extraction
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
