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

      # URL to navigate to
      sig { returns(String) }
      attr_accessor :url

      # Target frame ID for the navigation
      sig { returns(T.nilable(String)) }
      attr_reader :frame_id

      sig { params(frame_id: String).void }
      attr_writer :frame_id

      sig { returns(T.nilable(Stagehand::SessionNavigateParams::Options)) }
      attr_reader :options

      sig do
        params(options: Stagehand::SessionNavigateParams::Options::OrHash).void
      end
      attr_writer :options

      # Client SDK language
      sig do
        returns(
          T.nilable(Stagehand::SessionNavigateParams::XLanguage::OrSymbol)
        )
      end
      attr_reader :x_language

      sig do
        params(
          x_language: Stagehand::SessionNavigateParams::XLanguage::OrSymbol
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
          T.nilable(Stagehand::SessionNavigateParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            Stagehand::SessionNavigateParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          url: String,
          frame_id: String,
          options: Stagehand::SessionNavigateParams::Options::OrHash,
          x_language: Stagehand::SessionNavigateParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionNavigateParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # URL to navigate to
        url:,
        # Target frame ID for the navigation
        frame_id: nil,
        options: nil,
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
            url: String,
            frame_id: String,
            options: Stagehand::SessionNavigateParams::Options,
            x_language: Stagehand::SessionNavigateParams::XLanguage::OrSymbol,
            x_sdk_version: String,
            x_sent_at: Time,
            x_stream_response:
              Stagehand::SessionNavigateParams::XStreamResponse::OrSymbol,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Options < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::SessionNavigateParams::Options,
              Stagehand::Internal::AnyHash
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
              Stagehand::SessionNavigateParams::Options::WaitUntil::OrSymbol
            )
          )
        end
        attr_reader :wait_until

        sig do
          params(
            wait_until:
              Stagehand::SessionNavigateParams::Options::WaitUntil::OrSymbol
          ).void
        end
        attr_writer :wait_until

        sig do
          params(
            referer: String,
            timeout: Float,
            wait_until:
              Stagehand::SessionNavigateParams::Options::WaitUntil::OrSymbol
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
                Stagehand::SessionNavigateParams::Options::WaitUntil::OrSymbol
            }
          )
        end
        def to_hash
        end

        # When to consider navigation complete
        module WaitUntil
          extend Stagehand::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Stagehand::SessionNavigateParams::Options::WaitUntil
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          LOAD =
            T.let(
              :load,
              Stagehand::SessionNavigateParams::Options::WaitUntil::TaggedSymbol
            )
          DOMCONTENTLOADED =
            T.let(
              :domcontentloaded,
              Stagehand::SessionNavigateParams::Options::WaitUntil::TaggedSymbol
            )
          NETWORKIDLE =
            T.let(
              :networkidle,
              Stagehand::SessionNavigateParams::Options::WaitUntil::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Stagehand::SessionNavigateParams::Options::WaitUntil::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # Client SDK language
      module XLanguage
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Stagehand::SessionNavigateParams::XLanguage)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TYPESCRIPT =
          T.let(
            :typescript,
            Stagehand::SessionNavigateParams::XLanguage::TaggedSymbol
          )
        PYTHON =
          T.let(
            :python,
            Stagehand::SessionNavigateParams::XLanguage::TaggedSymbol
          )
        PLAYGROUND =
          T.let(
            :playground,
            Stagehand::SessionNavigateParams::XLanguage::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Stagehand::SessionNavigateParams::XLanguage::TaggedSymbol]
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
            T.all(Symbol, Stagehand::SessionNavigateParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Stagehand::SessionNavigateParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Stagehand::SessionNavigateParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::SessionNavigateParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
