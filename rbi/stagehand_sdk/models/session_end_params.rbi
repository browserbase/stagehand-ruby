# typed: strong

module StagehandSDK
  module Models
    class SessionEndParams < StagehandSDK::Internal::Type::BaseModel
      extend StagehandSDK::Internal::Type::RequestParameters::Converter
      include StagehandSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(StagehandSDK::SessionEndParams, StagehandSDK::Internal::AnyHash)
        end

      sig { returns(T.nilable(T.anything)) }
      attr_reader :_force_body

      sig { params(_force_body: T.anything).void }
      attr_writer :_force_body

      # ISO timestamp when request was sent
      sig { returns(T.nilable(Time)) }
      attr_reader :x_sent_at

      sig { params(x_sent_at: Time).void }
      attr_writer :x_sent_at

      # Whether to stream the response via SSE
      sig do
        returns(
          T.nilable(StagehandSDK::SessionEndParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            StagehandSDK::SessionEndParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          _force_body: T.anything,
          x_sent_at: Time,
          x_stream_response:
            StagehandSDK::SessionEndParams::XStreamResponse::OrSymbol,
          request_options: StagehandSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        _force_body: nil,
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
            _force_body: T.anything,
            x_sent_at: Time,
            x_stream_response:
              StagehandSDK::SessionEndParams::XStreamResponse::OrSymbol,
            request_options: StagehandSDK::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether to stream the response via SSE
      module XStreamResponse
        extend StagehandSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, StagehandSDK::SessionEndParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            StagehandSDK::SessionEndParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            StagehandSDK::SessionEndParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              StagehandSDK::SessionEndParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
