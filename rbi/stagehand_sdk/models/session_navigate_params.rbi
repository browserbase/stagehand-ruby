# typed: strong

module StagehandSDK
  module Models
    class SessionNavigateParams < StagehandSDK::Internal::Type::BaseModel
      extend StagehandSDK::Internal::Type::RequestParameters::Converter
      include StagehandSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            StagehandSDK::SessionNavigateParams,
            StagehandSDK::Internal::AnyHash
          )
        end

      # URL to navigate to
      sig { returns(String) }
      attr_accessor :url

      # Target frame ID for the navigation
      sig { returns(T.nilable(String)) }
      attr_accessor :frame_id

      sig { returns(T.nilable(StagehandSDK::SessionNavigateParams::Options)) }
      attr_reader :options

      sig do
        params(
          options: StagehandSDK::SessionNavigateParams::Options::OrHash
        ).void
      end
      attr_writer :options

      # Whether to stream the response via SSE
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :stream_response

      sig { params(stream_response: T::Boolean).void }
      attr_writer :stream_response

      # Whether to stream the response via SSE
      sig do
        returns(
          T.nilable(
            StagehandSDK::SessionNavigateParams::XStreamResponse::OrSymbol
          )
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            StagehandSDK::SessionNavigateParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          url: String,
          frame_id: T.nilable(String),
          options: StagehandSDK::SessionNavigateParams::Options::OrHash,
          stream_response: T::Boolean,
          x_stream_response:
            StagehandSDK::SessionNavigateParams::XStreamResponse::OrSymbol,
          request_options: StagehandSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # URL to navigate to
        url:,
        # Target frame ID for the navigation
        frame_id: nil,
        options: nil,
        # Whether to stream the response via SSE
        stream_response: nil,
        # Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            url: String,
            frame_id: T.nilable(String),
            options: StagehandSDK::SessionNavigateParams::Options,
            stream_response: T::Boolean,
            x_stream_response:
              StagehandSDK::SessionNavigateParams::XStreamResponse::OrSymbol,
            request_options: StagehandSDK::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Options < StagehandSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              StagehandSDK::SessionNavigateParams::Options,
              StagehandSDK::Internal::AnyHash
            )
          end

        # Referer header to send with the request
        sig { returns(T.nilable(String)) }
        attr_reader :referer

        sig { params(referer: String).void }
        attr_writer :referer

        # Timeout in ms for the navigation
        sig { returns(T.nilable(Float)) }
        attr_reader :timeout

        sig { params(timeout: Float).void }
        attr_writer :timeout

        # When to consider navigation complete
        sig do
          returns(
            T.nilable(
              StagehandSDK::SessionNavigateParams::Options::WaitUntil::OrSymbol
            )
          )
        end
        attr_reader :wait_until

        sig do
          params(
            wait_until:
              StagehandSDK::SessionNavigateParams::Options::WaitUntil::OrSymbol
          ).void
        end
        attr_writer :wait_until

        sig do
          params(
            referer: String,
            timeout: Float,
            wait_until:
              StagehandSDK::SessionNavigateParams::Options::WaitUntil::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Referer header to send with the request
          referer: nil,
          # Timeout in ms for the navigation
          timeout: nil,
          # When to consider navigation complete
          wait_until: nil
        )
        end

        sig do
          override.returns(
            {
              referer: String,
              timeout: Float,
              wait_until:
                StagehandSDK::SessionNavigateParams::Options::WaitUntil::OrSymbol
            }
          )
        end
        def to_hash
        end

        # When to consider navigation complete
        module WaitUntil
          extend StagehandSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                StagehandSDK::SessionNavigateParams::Options::WaitUntil
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOAD =
            T.let(
              :load,
              StagehandSDK::SessionNavigateParams::Options::WaitUntil::TaggedSymbol
            )
          DOMCONTENTLOADED =
            T.let(
              :domcontentloaded,
              StagehandSDK::SessionNavigateParams::Options::WaitUntil::TaggedSymbol
            )
          NETWORKIDLE =
            T.let(
              :networkidle,
              StagehandSDK::SessionNavigateParams::Options::WaitUntil::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                StagehandSDK::SessionNavigateParams::Options::WaitUntil::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Whether to stream the response via SSE
      module XStreamResponse
        extend StagehandSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, StagehandSDK::SessionNavigateParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            StagehandSDK::SessionNavigateParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            StagehandSDK::SessionNavigateParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              StagehandSDK::SessionNavigateParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
