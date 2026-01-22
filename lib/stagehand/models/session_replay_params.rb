# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#replay
    class SessionReplayParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionReplayParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionReplayParams::XStreamResponse }

      # @!method initialize(x_stream_response: nil, request_options: {})
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionReplayParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

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
