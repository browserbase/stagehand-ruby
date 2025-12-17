# typed: strong

module Stagehand
  module Models
    class SessionEndParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionEndParams, Stagehand::Internal::AnyHash)
        end

      # Client SDK language
      sig do
        returns(T.nilable(Stagehand::SessionEndParams::XLanguage::OrSymbol))
      end
      attr_reader :x_language

      sig do
        params(
          x_language: Stagehand::SessionEndParams::XLanguage::OrSymbol
        ).void
      end
      attr_writer :x_language

      # Version of the Stagehand SDK
      sig { returns(T.nilable(String)) }
      attr_reader :x_sdk_version

      sig { params(x_sdk_version: String).void }
      attr_writer :x_sdk_version

      # ISO timestamp when request was sent
      sig { returns(T.nilable(Time)) }
      attr_reader :x_sent_at

      sig { params(x_sent_at: Time).void }
      attr_writer :x_sent_at

      # Whether to stream the response via SSE
      sig do
        returns(
          T.nilable(Stagehand::SessionEndParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            Stagehand::SessionEndParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          x_language: Stagehand::SessionEndParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionEndParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Client SDK language
        x_language: nil,
        # Version of the Stagehand SDK
        x_sdk_version: nil,
        # ISO timestamp when request was sent
        x_sent_at: nil,
        # Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            x_language: Stagehand::SessionEndParams::XLanguage::OrSymbol,
            x_sdk_version: String,
            x_sent_at: Time,
            x_stream_response:
              Stagehand::SessionEndParams::XStreamResponse::OrSymbol,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Client SDK language
      module XLanguage
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Stagehand::SessionEndParams::XLanguage) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TYPESCRIPT =
          T.let(
            :typescript,
            Stagehand::SessionEndParams::XLanguage::TaggedSymbol
          )
        PYTHON =
          T.let(:python, Stagehand::SessionEndParams::XLanguage::TaggedSymbol)
        PLAYGROUND =
          T.let(
            :playground,
            Stagehand::SessionEndParams::XLanguage::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Stagehand::SessionEndParams::XLanguage::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # Whether to stream the response via SSE
      module XStreamResponse
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Stagehand::SessionEndParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Stagehand::SessionEndParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Stagehand::SessionEndParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Stagehand::SessionEndParams::XStreamResponse::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
