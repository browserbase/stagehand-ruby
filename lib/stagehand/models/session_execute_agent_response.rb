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

      # @!method initialize(message: nil)
      #   @param message [String] Final message from the agent
    end
  end
end
