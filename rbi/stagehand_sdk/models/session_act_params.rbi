# typed: strong

module StagehandSDK
  module Models
    class SessionActParams < StagehandSDK::Internal::Type::BaseModel
      extend StagehandSDK::Internal::Type::RequestParameters::Converter
      include StagehandSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(StagehandSDK::SessionActParams, StagehandSDK::Internal::AnyHash)
        end

      # Natural language instruction or Action object
      sig { returns(T.any(String, StagehandSDK::Action)) }
      attr_accessor :input

      # Target frame ID for the action
      sig { returns(T.nilable(String)) }
      attr_accessor :frame_id

      sig { returns(T.nilable(StagehandSDK::SessionActParams::Options)) }
      attr_reader :options

      sig do
        params(options: StagehandSDK::SessionActParams::Options::OrHash).void
      end
      attr_writer :options

      # Whether to stream the response via SSE
      sig do
        returns(
          T.nilable(StagehandSDK::SessionActParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            StagehandSDK::SessionActParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          input: T.any(String, StagehandSDK::Action::OrHash),
          frame_id: T.nilable(String),
          options: StagehandSDK::SessionActParams::Options::OrHash,
          x_stream_response:
            StagehandSDK::SessionActParams::XStreamResponse::OrSymbol,
          request_options: StagehandSDK::RequestOptions::OrHash
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
            input: T.any(String, StagehandSDK::Action),
            frame_id: T.nilable(String),
            options: StagehandSDK::SessionActParams::Options,
            x_stream_response:
              StagehandSDK::SessionActParams::XStreamResponse::OrSymbol,
            request_options: StagehandSDK::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Natural language instruction or Action object
      module Input
        extend StagehandSDK::Internal::Type::Union

        Variants = T.type_alias { T.any(String, StagehandSDK::Action) }

        sig do
          override.returns(
            T::Array[StagehandSDK::SessionActParams::Input::Variants]
          )
        end
        def self.variants
        end
      end

      class Options < StagehandSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              StagehandSDK::SessionActParams::Options,
              StagehandSDK::Internal::AnyHash
            )
          end

        # Model name string with provider prefix. Always use the format
        # 'provider/model-name' (e.g., 'openai/gpt-4o',
        # 'anthropic/claude-sonnet-4-5-20250929', 'google/gemini-2.0-flash')
        sig do
          returns(
            T.nilable(
              T.any(String, StagehandSDK::ModelConfig::ModelConfigObject)
            )
          )
        end
        attr_reader :model

        sig do
          params(
            model:
              T.any(
                String,
                StagehandSDK::ModelConfig::ModelConfigObject::OrHash
              )
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
              T.any(
                String,
                StagehandSDK::ModelConfig::ModelConfigObject::OrHash
              ),
            timeout: Float,
            variables: T::Hash[Symbol, String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Model name string with provider prefix. Always use the format
          # 'provider/model-name' (e.g., 'openai/gpt-4o',
          # 'anthropic/claude-sonnet-4-5-20250929', 'google/gemini-2.0-flash')
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
              model:
                T.any(String, StagehandSDK::ModelConfig::ModelConfigObject),
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
        extend StagehandSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, StagehandSDK::SessionActParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            StagehandSDK::SessionActParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            StagehandSDK::SessionActParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              StagehandSDK::SessionActParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
