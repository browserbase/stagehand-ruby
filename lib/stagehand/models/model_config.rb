# frozen_string_literal: true

module Stagehand
  module Models
    class ModelConfig < Stagehand::Internal::Type::BaseModel
      # @!attribute model_name
      #   Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
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

      # @!attribute headers
      #   Custom headers sent with every request to the model provider
      #
      #   @return [Hash{Symbol=>String}, nil]
      optional :headers, Stagehand::Internal::Type::HashOf[String]

      # @!attribute provider
      #   AI provider for the model (or provide a baseURL endpoint instead)
      #
      #   @return [Symbol, Stagehand::Models::ModelConfig::Provider, nil]
      optional :provider, enum: -> { Stagehand::ModelConfig::Provider }

      # @!method initialize(model_name:, api_key: nil, base_url: nil, headers: nil, provider: nil)
      #   @param model_name [String] Model name string with provider prefix (e.g., 'openai/gpt-5-nano')
      #
      #   @param api_key [String] API key for the model provider
      #
      #   @param base_url [String] Base URL for the model provider
      #
      #   @param headers [Hash{Symbol=>String}] Custom headers sent with every request to the model provider
      #
      #   @param provider [Symbol, Stagehand::Models::ModelConfig::Provider] AI provider for the model (or provide a baseURL endpoint instead)

      # AI provider for the model (or provide a baseURL endpoint instead)
      #
      # @see Stagehand::Models::ModelConfig#provider
      module Provider
        extend Stagehand::Internal::Type::Enum

        OPENAI = :openai
        ANTHROPIC = :anthropic
        GOOGLE = :google
        MICROSOFT = :microsoft
        BEDROCK = :bedrock

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
