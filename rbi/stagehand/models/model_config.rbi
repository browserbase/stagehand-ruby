# typed: strong

module Stagehand
  module Models
    class ModelConfig < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Stagehand::ModelConfig, Stagehand::Internal::AnyHash)
        end

      # API key for the model provider
      sig { returns(T.nilable(String)) }
      attr_reader :api_key

      sig { params(api_key: String).void }
      attr_writer :api_key

      # Custom base URL for API
      sig { returns(T.nilable(String)) }
      attr_reader :base_url

      sig { params(base_url: String).void }
      attr_writer :base_url

      # Model name
      sig { returns(T.nilable(String)) }
      attr_reader :model

      sig { params(model: String).void }
      attr_writer :model

      sig { returns(T.nilable(Stagehand::ModelConfig::Provider::OrSymbol)) }
      attr_reader :provider

      sig { params(provider: Stagehand::ModelConfig::Provider::OrSymbol).void }
      attr_writer :provider

      sig do
        params(
          api_key: String,
          base_url: String,
          model: String,
          provider: Stagehand::ModelConfig::Provider::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # API key for the model provider
        api_key: nil,
        # Custom base URL for API
        base_url: nil,
        # Model name
        model: nil,
        provider: nil
      )
      end

      sig do
        override.returns(
          {
            api_key: String,
            base_url: String,
            model: String,
            provider: Stagehand::ModelConfig::Provider::OrSymbol
          }
        )
      end
      def to_hash
      end

      module Provider
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Stagehand::ModelConfig::Provider) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        OPENAI = T.let(:openai, Stagehand::ModelConfig::Provider::TaggedSymbol)
        ANTHROPIC =
          T.let(:anthropic, Stagehand::ModelConfig::Provider::TaggedSymbol)
        GOOGLE = T.let(:google, Stagehand::ModelConfig::Provider::TaggedSymbol)

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
