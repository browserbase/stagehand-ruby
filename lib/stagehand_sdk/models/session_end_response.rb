# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#end_
    class SessionEndResponse < StagehandSDK::Internal::Type::BaseModel
      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, StagehandSDK::Internal::Type::Boolean

      # @!method initialize(success:)
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
