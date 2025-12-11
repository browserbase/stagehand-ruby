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

      # Frame ID to observe
      sig { returns(T.nilable(String)) }
      attr_reader :frame_id

      sig { params(frame_id: String).void }
      attr_writer :frame_id

      # Natural language instruction to filter actions
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
          x_stream_response:
            Stagehand::SessionObserveParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Frame ID to observe
        frame_id: nil,
        # Natural language instruction to filter actions
        instruction: nil,
        options: nil,
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

        sig { returns(T.nilable(Stagehand::ModelConfig)) }
        attr_reader :model

        sig { params(model: Stagehand::ModelConfig::OrHash).void }
        attr_writer :model

        # Observe only elements matching this selector
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
          # Observe only elements matching this selector
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
