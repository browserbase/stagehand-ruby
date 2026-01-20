# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#end_
    class SessionEndParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute _force_body
      #
      #   @return [Object, nil]
      optional :_force_body, Stagehand::Internal::Type::Unknown, api_name: :_forceBody

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, Stagehand::Models::SessionEndParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { Stagehand::SessionEndParams::XStreamResponse }

      # @!method initialize(_force_body: nil, x_stream_response: nil, request_options: {})
      #   @param _force_body [Object]
      #
      #   @param x_stream_response [Symbol, Stagehand::Models::SessionEndParams::XStreamResponse] Whether to stream the response via SSE
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
