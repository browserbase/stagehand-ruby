# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#end_
    class SessionEndParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute x_language
      #   Client SDK language
      #
      #   @return [Symbol, Stagehand::Models::SessionEndParams::XLanguage, nil]
      optional :x_language, enum: -> { Stagehand::SessionEndParams::XLanguage }

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
      #   @return [Symbol, Stagehand::Models::SessionEndParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionEndParams::XStreamResponse }

      # @!method initialize(x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param x_language [Symbol, Stagehand::Models::SessionEndParams::XLanguage] Client SDK language
      #
      #   @param x_sdk_version [String] Version of the Stagehand SDK
      #
      #   @param x_sent_at [Time] ISO timestamp when request was sent
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionEndParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

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
