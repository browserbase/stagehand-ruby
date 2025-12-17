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

        sig do
          params(model_name: String, api_key: String, base_url: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Model name string without prefix (e.g., 'gpt-5-nano', 'claude-4.5-opus')
          model_name:,
          # API key for the model provider
          api_key: nil,
          # Base URL for the model provider
          base_url: nil
        )
        end

        sig do
          override.returns(
            { model_name: String, api_key: String, base_url: String }
          )
        end
        def to_hash
        end
      end

      sig { override.returns(T::Array[Stagehand::ModelConfig::Variants]) }
      def self.variants
      end
    end
  end
end
