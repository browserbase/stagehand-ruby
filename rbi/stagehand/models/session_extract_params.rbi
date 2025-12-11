# typed: strong

module Stagehand
  module Models
    class SessionExtractParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionExtractParams, Stagehand::Internal::AnyHash)
        end

      # Frame ID to extract from
      sig { returns(T.nilable(String)) }
      attr_reader :frame_id

      sig { params(frame_id: String).void }
      attr_writer :frame_id

      # Natural language instruction for extraction
      sig { returns(T.nilable(String)) }
      attr_reader :instruction

      sig { params(instruction: String).void }
      attr_writer :instruction

      sig { returns(T.nilable(Stagehand::SessionExtractParams::Options)) }
      attr_reader :options

      sig do
        params(options: Stagehand::SessionExtractParams::Options::OrHash).void
      end
      attr_writer :options

      # JSON Schema for structured output
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :schema

      sig { params(schema: T::Hash[Symbol, T.anything]).void }
      attr_writer :schema

      sig do
        returns(
          T.nilable(Stagehand::SessionExtractParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            Stagehand::SessionExtractParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          frame_id: String,
          instruction: String,
          options: Stagehand::SessionExtractParams::Options::OrHash,
          schema: T::Hash[Symbol, T.anything],
          x_stream_response:
            Stagehand::SessionExtractParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Frame ID to extract from
        frame_id: nil,
        # Natural language instruction for extraction
        instruction: nil,
        options: nil,
        # JSON Schema for structured output
        schema: nil,
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            frame_id: String,
            instruction: String,
            options: Stagehand::SessionExtractParams::Options,
            schema: T::Hash[Symbol, T.anything],
            x_stream_response:
              Stagehand::SessionExtractParams::XStreamResponse::OrSymbol,
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
              Stagehand::SessionExtractParams::Options,
              Stagehand::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Stagehand::ModelConfig)) }
        attr_reader :model

        sig { params(model: Stagehand::ModelConfig::OrHash).void }
        attr_writer :model

        # Extract only from elements matching this selector
        sig { returns(T.nilable(String)) }
        attr_reader :selector

        sig { params(selector: String).void }
        attr_writer :selector

        sig { returns(T.nilable(Integer)) }
        attr_reader :timeout

        sig { params(timeout: Integer).void }
        attr_writer :timeout

        sig do
          params(
            model: Stagehand::ModelConfig::OrHash,
            selector: String,
            timeout: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          model: nil,
          # Extract only from elements matching this selector
          selector: nil,
          timeout: nil
        )
        end

        sig do
          override.returns(
            {
              model: Stagehand::ModelConfig,
              selector: String,
              timeout: Integer
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
            T.all(Symbol, Stagehand::SessionExtractParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Stagehand::SessionExtractParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Stagehand::SessionExtractParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::SessionExtractParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
