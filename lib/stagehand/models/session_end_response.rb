# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#end_
    class SessionEndResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, Stagehand::Models::SessionEndResponse::Success]
      required :success, enum: -> { Stagehand::Models::SessionEndResponse::Success }

      # @!method initialize(success:)
      #   @param success [Boolean, Stagehand::Models::SessionEndResponse::Success]

      # @see Stagehand::Models::SessionEndResponse#success
      module Success
        extend Stagehand::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
