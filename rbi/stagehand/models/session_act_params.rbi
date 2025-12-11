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

      # Natural language instruction
      sig { returns(T.any(String, Stagehand::Action)) }
      attr_accessor :input

      # Frame ID to act on (optional)
      sig { returns(T.nilable(String)) }
      attr_reader :frame_id

      sig { params(frame_id: String).void }
      attr_writer :frame_id

      sig { returns(T.nilable(Stagehand::SessionActParams::Options)) }
      attr_reader :options

      sig { params(options: Stagehand::SessionActParams::Options::OrHash).void }
      attr_writer :options

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
          x_stream_response:
            Stagehand::SessionActParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Natural language instruction
        input:,
        # Frame ID to act on (optional)
        frame_id: nil,
        options: nil,
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
            x_stream_response:
              Stagehand::SessionActParams::XStreamResponse::OrSymbol,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Natural language instruction
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

        sig { returns(T.nilable(Stagehand::ModelConfig)) }
        attr_reader :model

        sig { params(model: Stagehand::ModelConfig::OrHash).void }
        attr_writer :model

        # Timeout in milliseconds
        sig { returns(T.nilable(Integer)) }
        attr_reader :timeout

        sig { params(timeout: Integer).void }
        attr_writer :timeout

        # Template variables for instruction
        sig { returns(T.nilable(T::Hash[Symbol, String])) }
        attr_reader :variables

        sig { params(variables: T::Hash[Symbol, String]).void }
        attr_writer :variables

        sig do
          params(
            model: Stagehand::ModelConfig::OrHash,
            timeout: Integer,
            variables: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
          model: nil,
          # Timeout in milliseconds
          timeout: nil,
          # Template variables for instruction
          variables: nil
        )
        end

        sig do
          override.returns(
            {
              model: Stagehand::ModelConfig,
              timeout: Integer,
              variables: T::Hash[Symbol, String]
            }
          )
        end
        def to_hash
        end
      end

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
