# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#end_
    class SessionEndParams < StagehandSDK::Internal::Type::BaseModel
      extend StagehandSDK::Internal::Type::RequestParameters::Converter
      include StagehandSDK::Internal::Type::RequestParameters

      # @!attribute _force_body
      #
      #   @return [Object, nil]
      optional :_force_body, StagehandSDK::Internal::Type::Unknown, api_name: :_forceBody

      # @!attribute x_stream_response
      #   Whether to stream the response via SSE
      #
      #   @return [Symbol, StagehandSDK::Models::SessionEndParams::XStreamResponse, nil]
      optional :x_stream_response, enum: -> { StagehandSDK::SessionEndParams::XStreamResponse }

      # @!method initialize(_force_body: nil, x_stream_response: nil, request_options: {})
      #   @param _force_body [Object]
      #
      #   @param x_stream_response [Symbol, StagehandSDK::Models::SessionEndParams::XStreamResponse] Whether to stream the response via SSE
      #
      #   @param request_options [StagehandSDK::RequestOptions, Hash{Symbol=>Object}]

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
