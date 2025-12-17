# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#navigate
    class SessionNavigateResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Stagehand::Models::SessionNavigateResponse::Data]
      required :data, -> { Stagehand::Models::SessionNavigateResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, Stagehand::Models::SessionNavigateResponse::Success]
      required :success, enum: -> { Stagehand::Models::SessionNavigateResponse::Success }

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionNavigateResponse::Data]
      #   @param success [Boolean, Stagehand::Models::SessionNavigateResponse::Success]

      # @see Stagehand::Models::SessionNavigateResponse#data
      class Data < Stagehand::Internal::Type::BaseModel
        # @!attribute result
        #   Navigation response (Playwright Response object or null)
        #
        #   @return [Object]
        required :result, Stagehand::Internal::Type::Unknown

        # @!attribute action_id
        #   Action ID for tracking
        #
        #   @return [String, nil]
        optional :action_id, String, api_name: :actionId

        # @!method initialize(result:, action_id: nil)
        #   @param result [Object] Navigation response (Playwright Response object or null)
        #
        #   @param action_id [String] Action ID for tracking
      end

      # @see Stagehand::Models::SessionNavigateResponse#success
      module Success
        extend Stagehand::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
