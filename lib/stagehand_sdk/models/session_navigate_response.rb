# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#navigate
    class SessionNavigateResponse < StagehandSDK::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [StagehandSDK::Models::SessionNavigateResponse::Data]
      required :data, -> { StagehandSDK::Models::SessionNavigateResponse::Data }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, StagehandSDK::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [StagehandSDK::Models::SessionNavigateResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see StagehandSDK::Models::SessionNavigateResponse#data
      class Data < StagehandSDK::Internal::Type::BaseModel
        # @!attribute result
        #   Navigation response (Playwright Response object or null)
        #
        #   @return [Object]
        required :result, StagehandSDK::Internal::Type::Unknown

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
