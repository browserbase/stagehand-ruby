# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#end_
    class SessionEndResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, Stagehand::Internal::Type::Boolean

      # @!method initialize(success:)
      #   @param success [Boolean] Indicates whether the request was successful
    end
  end
end
