# typed: strong

module Stagehand
  module Models
    # Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
    # 'anthropic/claude-4.5-opus')
    module ModelConfig
      extend Stagehand::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(String, Stagehand::ModelConfig::ModelConfigObject)
        end

      class ModelConfigObject < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::ModelConfig::ModelConfigObject,
              Stagehand::Internal::AnyHash
            )
          end

        # Model name string without prefix (e.g., 'gpt-5-nano', 'claude-4.5-opus')
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
              Stagehand::ModelConfig::ModelConfigObject::Provider::OrSymbol
            )
          )
        end
        attr_reader :provider

        sig do
          params(
            provider:
              Stagehand::ModelConfig::ModelConfigObject::Provider::OrSymbol
          ).void
        end
        attr_writer :provider

        sig do
          params(
            model_name: String,
            api_key: String,
            base_url: String,
            provider:
              Stagehand::ModelConfig::ModelConfigObject::Provider::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Model name string without prefix (e.g., 'gpt-5-nano', 'claude-4.5-opus')
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
                Stagehand::ModelConfig::ModelConfigObject::Provider::OrSymbol
            }
          )
        end
        def to_hash
        end

        # AI provider for the model (or provide a baseURL endpoint instead)
        module Provider
          extend Stagehand::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Stagehand::ModelConfig::ModelConfigObject::Provider)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OPENAI =
            T.let(
              :openai,
              Stagehand::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
            )
          ANTHROPIC =
            T.let(
              :anthropic,
              Stagehand::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
            )
          GOOGLE =
            T.let(
              :google,
              Stagehand::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
            )
          MICROSOFT =
            T.let(
              :microsoft,
              Stagehand::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Stagehand::ModelConfig::ModelConfigObject::Provider::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      sig { override.returns(T::Array[Stagehand::ModelConfig::Variants]) }
      def self.variants
      end
    end
  end
end
