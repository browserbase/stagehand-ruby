# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#start
    class SessionStartResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute available
      #   Whether the session is ready to use
      #
      #   @return [Boolean]
      required :available, Stagehand::Internal::Type::Boolean

      # @!attribute session_id
      #   Unique identifier for the session
      #
      #   @return [String]
      required :session_id, String, api_name: :sessionId

      # @!method initialize(available:, session_id:)
      #   @param available [Boolean] Whether the session is ready to use
      #
      #   @param session_id [String] Unique identifier for the session
    end
  end
end
