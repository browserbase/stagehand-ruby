# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#start
    class SessionStartResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Stagehand::Models::SessionStartResponse::Data]
      required :data, -> { Stagehand::Models::SessionStartResponse::Data }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, Stagehand::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionStartResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Stagehand::Models::SessionStartResponse#data
      class Data < Stagehand::Internal::Type::BaseModel
        # @!attribute available
        #
        #   @return [Boolean]
        required :available, Stagehand::Internal::Type::Boolean

        # @!attribute session_id
        #   Unique session identifier
        #
        #   @return [String]
        required :session_id, String, api_name: :sessionId

        # @!method initialize(available:, session_id:)
        #   @param available [Boolean]
        #
        #   @param session_id [String] Unique session identifier
      end
    end
  end
end
