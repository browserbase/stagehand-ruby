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

        # @!attribute connect_url
        #   CDP WebSocket URL for connecting to the Browserbase cloud browser
        #
        #   @return [String]
        required :connect_url, String, api_name: :connectUrl

        # @!attribute session_id
        #   Unique Browserbase session identifier
        #
        #   @return [String]
        required :session_id, String, api_name: :sessionId

        # @!method initialize(available:, connect_url:, session_id:)
        #   @param available [Boolean]
        #
        #   @param connect_url [String] CDP WebSocket URL for connecting to the Browserbase cloud browser
        #
        #   @param session_id [String] Unique Browserbase session identifier
      end
    end
  end
end
