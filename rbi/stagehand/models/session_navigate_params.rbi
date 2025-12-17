# typed: strong

module Stagehand
  module Models
    class SessionNavigateParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionNavigateParams, Stagehand::Internal::AnyHash)
        end

      sig { returns(T.nilable(T.anything)) }
      attr_reader :body

      sig { params(body: T.anything).void }
      attr_writer :body

      sig { returns(T.nilable(T.anything)) }
      attr_reader :x_language

      sig { params(x_language: T.anything).void }
      attr_writer :x_language

      sig { returns(T.nilable(T.anything)) }
      attr_reader :x_sdk_version

      sig { params(x_sdk_version: T.anything).void }
      attr_writer :x_sdk_version

      sig { returns(T.nilable(T.anything)) }
      attr_reader :x_sent_at

      sig { params(x_sent_at: T.anything).void }
      attr_writer :x_sent_at

      sig { returns(T.nilable(T.anything)) }
      attr_reader :x_stream_response

      sig { params(x_stream_response: T.anything).void }
      attr_writer :x_stream_response

      sig do
        params(
          body: T.anything,
          x_language: T.anything,
          x_sdk_version: T.anything,
          x_sent_at: T.anything,
          x_stream_response: T.anything,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        body: nil,
        x_language: nil,
        x_sdk_version: nil,
        x_sent_at: nil,
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            body: T.anything,
            x_language: T.anything,
            x_sdk_version: T.anything,
            x_sent_at: T.anything,
            x_stream_response: T.anything,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
