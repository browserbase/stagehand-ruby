# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#extract
    #
    # @see StagehandSDK::Resources::Sessions#extract_streaming
    class SessionExtractResponse < StagehandSDK::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [StagehandSDK::Models::SessionExtractResponse::Data]
      required :data, -> { StagehandSDK::Models::SessionExtractResponse::Data }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, StagehandSDK::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [StagehandSDK::Models::SessionExtractResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see StagehandSDK::Models::SessionExtractResponse#data
      class Data < StagehandSDK::Internal::Type::BaseModel
        # @!attribute result
        #   Extracted data matching the requested schema
        #
        #   @return [Object]
        required :result, StagehandSDK::Internal::Type::Unknown

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
    end
  end
end
