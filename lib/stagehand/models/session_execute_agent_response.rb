# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#execute_agent
    class SessionExecuteAgentResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute message
      #   Final message from the agent
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute steps
      #   Steps taken by the agent
      #
      #   @return [Array<Object>, nil]
      optional :steps, Stagehand::Internal::Type::ArrayOf[Stagehand::Internal::Type::Unknown]

      # @!method initialize(message: nil, steps: nil)
      #   @param message [String] Final message from the agent
      #
      #   @param steps [Array<Object>] Steps taken by the agent
    end
  end
end
