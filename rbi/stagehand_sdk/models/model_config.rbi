# typed: strong

module StagehandSDK
  module Models
    # Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
    # 'anthropic/claude-4.5-opus')
    module ModelConfig
      extend StagehandSDK::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(String, StagehandSDK::ModelConfig::ModelConfigObject)
        end

      class ModelConfigObject < StagehandSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              StagehandSDK::ModelConfig::ModelConfigObject,
              StagehandSDK::Internal::AnyHash
            )
          end

        # Model name string (e.g., 'openai/gpt-5-nano', 'anthropic/claude-4.5-opus')
        sig { returns(String) }
        attr_accessor :model_name

        # API key for the model provider
        sig { returns(T.nilable(String)) }
        attr_reader :api_key

        sig { params(api_key: String).void }
        attr_writer :api_key

        # Base URL for the model provider
        sig { returns(T.nilable(String)) }
        attr_reader :base_url

        sig { params(base_url: String).void }
        attr_writer :base_url

        # AI provider for the model (or provide a baseURL endpoint instead)
        sig do
          returns(
            T.nilable(
              StagehandSDK::ModelConfig::ModelConfigObject::Provider::OrSymbol
            )
          )
        end
        attr_reader :provider

        sig do
          params(
            provider:
              StagehandSDK::ModelConfig::ModelConfigObject::Provider::OrSymbol
          ).void
        end
        attr_writer :provider

        sig do
          params(
            model_name: String,
            api_key: String,
            base_url: String,
            provider:
              StagehandSDK::ModelConfig::ModelConfigObject::Provider::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Model name string (e.g., 'openai/gpt-5-nano', 'anthropic/claude-4.5-opus')
          model_name:,
          # API key for the model provider
          api_key: nil,
          # Base URL for the model provider
          base_url: nil,
          # AI provider for the model (or provide a baseURL endpoint instead)
          provider: nil
        )
        end

        sig do
          override.returns(
            {
              model_name: String,
              api_key: String,
              base_url: String,
              provider:
                StagehandSDK::ModelConfig::ModelConfigObject::Provider::OrSymbol
            }
          )
        end
        def to_hash
        end

        # AI provider for the model (or provide a baseURL endpoint instead)
        module Provider
          extend StagehandSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                StagehandSDK::ModelConfig::ModelConfigObject::Provider
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OPENAI =
            T.let(
              :openai,
              StagehandSDK::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
            )
          ANTHROPIC =
            T.let(
              :anthropic,
              StagehandSDK::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
            )
          GOOGLE =
            T.let(
              :google,
              StagehandSDK::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
            )
          MICROSOFT =
            T.let(
              :microsoft,
              StagehandSDK::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                StagehandSDK::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig { override.returns(T::Array[StagehandSDK::ModelConfig::Variants]) }
      def self.variants
      end
    end
  end
end
