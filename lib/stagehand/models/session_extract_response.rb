# frozen_string_literal: true

module Stagehand
  module Models
    # Default extraction result
    #
    # @see Stagehand::Resources::Sessions#extract
    module SessionExtractResponse
      extend Stagehand::Internal::Type::Union

      # Default extraction result
      variant -> { Stagehand::Models::SessionExtractResponse::Extraction }

      # Structured data matching provided schema
      variant -> { Stagehand::Models::SessionExtractResponse::CustomMap }

      class Extraction < Stagehand::Internal::Type::BaseModel
        # @!attribute extraction
        #
        #   @return [String, nil]
        optional :extraction, String

        # @!method initialize(extraction: nil)
        #   Default extraction result
        #
        #   @param extraction [String]
      end

      # @!method self.variants
      #   @return [Array(Stagehand::Models::SessionExtractResponse::Extraction, Hash{Symbol=>Object})]

      # @type [Stagehand::Internal::Type::Converter]
      CustomMap = Stagehand::Internal::Type::HashOf[Stagehand::Internal::Type::Unknown]
    end
  end
end
