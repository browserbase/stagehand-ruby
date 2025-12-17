# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#navigate
    class SessionNavigateParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute body
      #
      #   @return [Object, nil]
      optional :body, Stagehand::Internal::Type::Unknown

      # @!attribute x_language
      #
      #   @return [Object, nil]
      optional :x_language, Stagehand::Internal::Type::Unknown

      # @!attribute x_sdk_version
      #
      #   @return [Object, nil]
      optional :x_sdk_version, Stagehand::Internal::Type::Unknown

      # @!attribute x_sent_at
      #
      #   @return [Object, nil]
      optional :x_sent_at, Stagehand::Internal::Type::Unknown

      # @!attribute x_stream_response
      #
      #   @return [Object, nil]
      optional :x_stream_response, Stagehand::Internal::Type::Unknown

      # @!method initialize(body: nil, x_language: nil, x_sdk_version: nil, x_sent_at: nil, x_stream_response: nil, request_options: {})
      #   @param body [Object]
      #   @param x_language [Object]
      #   @param x_sdk_version [Object]
      #   @param x_sent_at [Object]
      #   @param x_stream_response [Object]
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
