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

      # Target frame ID for the extraction
      sig { returns(T.nilable(String)) }
      attr_accessor :frame_id

      # Natural language instruction for what to extract
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

      # JSON Schema defining the structure of data to extract
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :schema

      sig { params(schema: T::Hash[Symbol, T.anything]).void }
      attr_writer :schema

      # Whether to stream the response via SSE
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
          frame_id: T.nilable(String),
          instruction: String,
          options: Stagehand::SessionExtractParams::Options::OrHash,
          schema: T::Hash[Symbol, T.anything],
          x_stream_response:
            Stagehand::SessionExtractParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Target frame ID for the extraction
        frame_id: nil,
        # Natural language instruction for what to extract
        instruction: nil,
        options: nil,
        # JSON Schema defining the structure of data to extract
        schema: nil,
        # Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            frame_id: T.nilable(String),
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

        # CSS selector to scope extraction to a specific element
        sig { returns(T.nilable(String)) }
        attr_reader :selector

        sig { params(selector: String).void }
        attr_writer :selector

        # Timeout in ms for the extraction
        sig { returns(T.nilable(Float)) }
        attr_reader :timeout

        sig { params(timeout: Float).void }
        attr_writer :timeout

        sig do
          params(
            model: Stagehand::ModelConfig::OrHash,
            selector: String,
            timeout: Float
          ).returns(T.attached_class)
        end
        def self.new(
          model: nil,
          # CSS selector to scope extraction to a specific element
          selector: nil,
          # Timeout in ms for the extraction
          timeout: nil
        )
        end

        sig do
          override.returns(
            { model: Stagehand::ModelConfig, selector: String, timeout: Float }
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
