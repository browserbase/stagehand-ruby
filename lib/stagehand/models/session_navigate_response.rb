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
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, Stagehand::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionNavigateResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

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
    end
  end
end
