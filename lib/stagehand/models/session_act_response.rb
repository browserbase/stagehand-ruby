# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#act
    class SessionActResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute actions
      #   Actions that were executed
      #
      #   @return [Array<Stagehand::Models::Action>]
      required :actions, -> { Stagehand::Internal::Type::ArrayOf[Stagehand::Action] }

      # @!attribute message
      #   Result message
      #
      #   @return [String]
      required :message, String

      # @!attribute success
      #   Whether the action succeeded
      #
      #   @return [Boolean]
      required :success, Stagehand::Internal::Type::Boolean

      # @!method initialize(actions:, message:, success:)
      #   @param actions [Array<Stagehand::Models::Action>] Actions that were executed
      #
      #   @param message [String] Result message
      #
      #   @param success [Boolean] Whether the action succeeded
    end
  end
end
