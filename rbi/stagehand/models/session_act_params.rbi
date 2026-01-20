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
      attr_accessor :frame_id

      sig { returns(T.nilable(Stagehand::SessionActParams::Options)) }
      attr_reader :options

      sig { params(options: Stagehand::SessionActParams::Options::OrHash).void }
      attr_writer :options

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
          frame_id: T.nilable(String),
          options: Stagehand::SessionActParams::Options::OrHash,
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
        # Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            input: T.any(String, Stagehand::Action),
            frame_id: T.nilable(String),
            options: Stagehand::SessionActParams::Options,
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

        sig { returns(T.nilable(Stagehand::ModelConfig)) }
        attr_reader :model

        sig { params(model: Stagehand::ModelConfig::OrHash).void }
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
            model: Stagehand::ModelConfig::OrHash,
            timeout: Float,
            variables: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
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
              model: Stagehand::ModelConfig,
              timeout: Float,
              variables: T::Hash[Symbol, String]
            }
          )
        end
        def to_hash
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
