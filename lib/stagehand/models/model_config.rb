# frozen_string_literal: true

module Stagehand
  module Models
    class ModelConfig < Stagehand::Internal::Type::BaseModel
      # @!attribute api_key
      #   API key for the model provider
      #
      #   @return [String, nil]
      optional :api_key, String, api_name: :apiKey

      # @!attribute base_url
      #   Custom base URL for API
      #
      #   @return [String, nil]
      optional :base_url, String, api_name: :baseURL

      # @!attribute model
      #   Model name
      #
      #   @return [String, nil]
      optional :model, String

      # @!attribute provider
      #
      #   @return [Symbol, Stagehand::Models::ModelConfig::Provider, nil]
      optional :provider, enum: -> { Stagehand::ModelConfig::Provider }

      # @!method initialize(api_key: nil, base_url: nil, model: nil, provider: nil)
      #   @param api_key [String] API key for the model provider
      #
      #   @param base_url [String] Custom base URL for API
      #
      #   @param model [String] Model name
      #
      #   @param provider [Symbol, Stagehand::Models::ModelConfig::Provider]

      # @see Stagehand::Models::ModelConfig#provider
      module Provider
        extend Stagehand::Internal::Type::Enum

        OPENAI = :openai
        ANTHROPIC = :anthropic
        GOOGLE = :google

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
