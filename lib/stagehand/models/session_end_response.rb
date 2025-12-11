# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#end_
    class SessionEndResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, nil]
      optional :success, Stagehand::Internal::Type::Boolean

      # @!method initialize(success: nil)
      #   @param success [Boolean]
    end
  end
end
