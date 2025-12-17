# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#extract
    class SessionExtractResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Stagehand::Models::SessionExtractResponse::Data]
      required :data, -> { Stagehand::Models::SessionExtractResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, Stagehand::Models::SessionExtractResponse::Success]
      required :success, enum: -> { Stagehand::Models::SessionExtractResponse::Success }

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionExtractResponse::Data]
      #   @param success [Boolean, Stagehand::Models::SessionExtractResponse::Success]

      # @see Stagehand::Models::SessionExtractResponse#data
      class Data < Stagehand::Internal::Type::BaseModel
        # @!attribute result
        #   Extracted data matching the requested schema
        #
        #   @return [Object]
        required :result, Stagehand::Internal::Type::Unknown

        # @!attribute action_id
        #   Action ID for tracking
        #
        #   @return [String, nil]
        optional :action_id, String, api_name: :actionId

        # @!method initialize(result:, action_id: nil)
        #   @param result [Object] Extracted data matching the requested schema
        #
        #   @param action_id [String] Action ID for tracking
      end

      # @see Stagehand::Models::SessionExtractResponse#success
      module Success
        extend Stagehand::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
