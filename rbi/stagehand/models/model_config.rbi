# typed: strong

module Stagehand
  module Models
    class ModelConfig < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Stagehand::ModelConfig, Stagehand::Internal::AnyHash)
        end

      # Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
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
      sig { returns(T.nilable(Stagehand::ModelConfig::Provider::OrSymbol)) }
      attr_reader :provider

      sig { params(provider: Stagehand::ModelConfig::Provider::OrSymbol).void }
      attr_writer :provider

      sig do
        params(
          model_name: String,
          api_key: String,
          base_url: String,
          provider: Stagehand::ModelConfig::Provider::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
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
            provider: Stagehand::ModelConfig::Provider::OrSymbol
          }
        )
      end
      def to_hash
      end

      # AI provider for the model (or provide a baseURL endpoint instead)
      module Provider
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Stagehand::ModelConfig::Provider) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENAI = T.let(:openai, Stagehand::ModelConfig::Provider::TaggedSymbol)
        ANTHROPIC =
          T.let(:anthropic, Stagehand::ModelConfig::Provider::TaggedSymbol)
        GOOGLE = T.let(:google, Stagehand::ModelConfig::Provider::TaggedSymbol)
        MICROSOFT =
          T.let(:microsoft, Stagehand::ModelConfig::Provider::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Stagehand::ModelConfig::Provider::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
