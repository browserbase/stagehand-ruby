# frozen_string_literal: true

module StagehandSDK
  module Models
    # Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
    # 'anthropic/claude-4.5-opus')
    module ModelConfig
      extend StagehandSDK::Internal::Type::Union

      # Model name string with provider prefix (e.g., 'openai/gpt-5-nano', 'anthropic/claude-4.5-opus')
      variant String

      variant -> { StagehandSDK::ModelConfig::ModelConfigObject }

      class ModelConfigObject < StagehandSDK::Internal::Type::BaseModel
        # @!attribute model_name
        #   Model name string (e.g., 'openai/gpt-5-nano', 'anthropic/claude-4.5-opus')
        #
        #   @return [String]
        required :model_name, String, api_name: :modelName

        # @!attribute api_key
        #   API key for the model provider
        #
        #   @return [String, nil]
        optional :api_key, String, api_name: :apiKey

        # @!attribute base_url
        #   Base URL for the model provider
        #
        #   @return [String, nil]
        optional :base_url, String, api_name: :baseURL

        # @!attribute provider
        #   AI provider for the model (or provide a baseURL endpoint instead)
        #
        #   @return [Symbol, StagehandSDK::Models::ModelConfig::ModelConfigObject::Provider, nil]
        optional :provider, enum: -> { StagehandSDK::ModelConfig::ModelConfigObject::Provider }

        # @!method initialize(model_name:, api_key: nil, base_url: nil, provider: nil)
        #   @param model_name [String] Model name string (e.g., 'openai/gpt-5-nano', 'anthropic/claude-4.5-opus')
        #
        #   @param api_key [String] API key for the model provider
        #
        #   @param base_url [String] Base URL for the model provider
        #
        #   @param provider [Symbol, StagehandSDK::Models::ModelConfig::ModelConfigObject::Provider] AI provider for the model (or provide a baseURL endpoint instead)

        # AI provider for the model (or provide a baseURL endpoint instead)
        #
        # @see StagehandSDK::Models::ModelConfig::ModelConfigObject#provider
        module Provider
          extend StagehandSDK::Internal::Type::Enum

          OPENAI = :openai
          ANTHROPIC = :anthropic
          GOOGLE = :google
          MICROSOFT = :microsoft

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @!method self.variants
      #   @return [Array(String, StagehandSDK::Models::ModelConfig::ModelConfigObject)]
    end
  end
end
