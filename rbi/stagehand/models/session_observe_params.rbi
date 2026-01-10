# typed: strong

module Stagehand
  module Models
    class SessionObserveParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionObserveParams, Stagehand::Internal::AnyHash)
        end

      # Target frame ID for the observation
      sig { returns(T.nilable(String)) }
      attr_reader :frame_id

      sig { params(frame_id: String).void }
      attr_writer :frame_id

      # Natural language instruction for what actions to find
      sig { returns(T.nilable(String)) }
      attr_reader :instruction

      sig { params(instruction: String).void }
      attr_writer :instruction

      sig { returns(T.nilable(Stagehand::SessionObserveParams::Options)) }
      attr_reader :options

      sig do
        params(options: Stagehand::SessionObserveParams::Options::OrHash).void
      end
      attr_writer :options

      # ISO timestamp when request was sent
      sig { returns(T.nilable(Time)) }
      attr_reader :x_sent_at

      sig { params(x_sent_at: Time).void }
      attr_writer :x_sent_at

      # Whether to stream the response via SSE
      sig do
        returns(
          T.nilable(Stagehand::SessionObserveParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            Stagehand::SessionObserveParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          frame_id: String,
          instruction: String,
          options: Stagehand::SessionObserveParams::Options::OrHash,
          x_sent_at: Time,
          x_stream_response:
            Stagehand::SessionObserveParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Target frame ID for the observation
        frame_id: nil,
        # Natural language instruction for what actions to find
        instruction: nil,
        options: nil,
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
            frame_id: String,
            instruction: String,
            options: Stagehand::SessionObserveParams::Options,
            x_sent_at: Time,
            x_stream_response:
              Stagehand::SessionObserveParams::XStreamResponse::OrSymbol,
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
              Stagehand::SessionObserveParams::Options,
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

        # CSS selector to scope observation to a specific element
        sig { returns(T.nilable(String)) }
        attr_reader :selector

        sig { params(selector: String).void }
        attr_writer :selector

        # Timeout in ms for the observation
        sig { returns(T.nilable(Float)) }
        attr_reader :timeout

        sig { params(timeout: Float).void }
        attr_writer :timeout

        sig do
          params(
            model:
              T.any(String, Stagehand::ModelConfig::ModelConfigObject::OrHash),
            selector: String,
            timeout: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
          # 'anthropic/claude-4.5-opus')
          model: nil,
          # CSS selector to scope observation to a specific element
          selector: nil,
          # Timeout in ms for the observation
          timeout: nil
        )
        end

        sig do
          override.returns(
            {
              model: T.any(String, Stagehand::ModelConfig::ModelConfigObject),
              selector: String,
              timeout: Float
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
            T.all(Symbol, Stagehand::SessionObserveParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Stagehand::SessionObserveParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Stagehand::SessionObserveParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::SessionObserveParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
