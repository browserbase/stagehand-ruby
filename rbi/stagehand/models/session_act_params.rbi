# typed: strong

module Stagehand
  module Models
    class SessionActParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionActParams, Stagehand::Internal::AnyHash)
        end

      # Natural language instruction or Action object
      sig { returns(T.any(String, Stagehand::Action)) }
      attr_accessor :input

      # Target frame ID for the action
      sig { returns(T.nilable(String)) }
      attr_reader :frame_id

      sig { params(frame_id: String).void }
      attr_writer :frame_id

      sig { returns(T.nilable(Stagehand::SessionActParams::Options)) }
      attr_reader :options

      sig { params(options: Stagehand::SessionActParams::Options::OrHash).void }
      attr_writer :options

      # Client SDK language
      sig do
        returns(T.nilable(Stagehand::SessionActParams::XLanguage::OrSymbol))
      end
      attr_reader :x_language

      sig do
        params(
          x_language: Stagehand::SessionActParams::XLanguage::OrSymbol
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
          T.nilable(Stagehand::SessionActParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            Stagehand::SessionActParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          input: T.any(String, Stagehand::Action::OrHash),
          frame_id: String,
          options: Stagehand::SessionActParams::Options::OrHash,
          x_language: Stagehand::SessionActParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionActParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Natural language instruction or Action object
        input:,
        # Target frame ID for the action
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
            input: T.any(String, Stagehand::Action),
            frame_id: String,
            options: Stagehand::SessionActParams::Options,
            x_language: Stagehand::SessionActParams::XLanguage::OrSymbol,
            x_sdk_version: String,
            x_sent_at: Time,
            x_stream_response:
              Stagehand::SessionActParams::XStreamResponse::OrSymbol,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Natural language instruction or Action object
      module Input
        extend Stagehand::Internal::Type::Union

        Variants = T.type_alias { T.any(String, Stagehand::Action) }

        sig do
          override.returns(
            T::Array[Stagehand::SessionActParams::Input::Variants]
          )
        end
        def self.variants
        end
      end

      class Options < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::SessionActParams::Options,
              Stagehand::Internal::AnyHash
            )
          end

        # Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
        # 'anthropic/claude-4.5-opus')
        sig do
          returns(
            T.nilable(T.any(String, Stagehand::ModelConfig::ModelConfigObject))
          )
        end
        attr_reader :model

        sig do
          params(
            model:
              T.any(String, Stagehand::ModelConfig::ModelConfigObject::OrHash)
          ).void
        end
        attr_writer :model

        # Timeout in ms for the action
        sig { returns(T.nilable(Float)) }
        attr_reader :timeout

        sig { params(timeout: Float).void }
        attr_writer :timeout

        # Variables to substitute in the action instruction
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :variables

        sig { params(variables: T::Hash[Symbol, String]).void }
        attr_writer :variables

        sig do
          params(
            model:
              T.any(String, Stagehand::ModelConfig::ModelConfigObject::OrHash),
            timeout: Float,
            variables: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
          # 'anthropic/claude-4.5-opus')
          model: nil,
          # Timeout in ms for the action
          timeout: nil,
          # Variables to substitute in the action instruction
          variables: nil
        )
        end

        sig do
          override.returns(
            {
              model: T.any(String, Stagehand::ModelConfig::ModelConfigObject),
              timeout: Float,
              variables: T::Hash[Symbol, String]
            }
          )
        end
        def to_hash
        end
      end

      # Client SDK language
      module XLanguage
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Stagehand::SessionActParams::XLanguage) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TYPESCRIPT =
          T.let(
            :typescript,
            Stagehand::SessionActParams::XLanguage::TaggedSymbol
          )
        PYTHON =
          T.let(:python, Stagehand::SessionActParams::XLanguage::TaggedSymbol)
        PLAYGROUND =
          T.let(
            :playground,
            Stagehand::SessionActParams::XLanguage::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Stagehand::SessionActParams::XLanguage::TaggedSymbol]
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
            T.all(Symbol, Stagehand::SessionActParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Stagehand::SessionActParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Stagehand::SessionActParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Stagehand::SessionActParams::XStreamResponse::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
