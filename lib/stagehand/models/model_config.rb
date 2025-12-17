# frozen_string_literal: true

module Stagehand
  module Models
    module ModelConfig
      extend Stagehand::Internal::Type::Union

      variant String

      variant -> { Stagehand::ModelConfig::UnionMember1 }

      class UnionMember1 < Stagehand::Internal::Type::BaseModel
        # @!attribute model_name
        #
        #   @return [String]
        required :model_name, String, api_name: :modelName

        # @!attribute api_key
        #
        #   @return [String, nil]
        optional :api_key, String, api_name: :apiKey

        # @!attribute base_url
        #
        #   @return [String, nil]
        optional :base_url, String, api_name: :baseURL

        # @!method initialize(model_name:, api_key: nil, base_url: nil)
        #   @param model_name [String]
        #   @param api_key [String]
        #   @param base_url [String]
      end

      # @!method self.variants
      #   @return [Array(String, Stagehand::Models::ModelConfig::UnionMember1)]
    end
  end
end
