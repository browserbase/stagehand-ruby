# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#start
    class SessionStartResponse < StagehandSDK::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [StagehandSDK::Models::SessionStartResponse::Data]
      required :data, -> { StagehandSDK::Models::SessionStartResponse::Data }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, StagehandSDK::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [StagehandSDK::Models::SessionStartResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see StagehandSDK::Models::SessionStartResponse#data
      class Data < StagehandSDK::Internal::Type::BaseModel
        # @!attribute available
        #
        #   @return [Boolean]
        required :available, StagehandSDK::Internal::Type::Boolean

        # @!attribute session_id
        #   Unique Browserbase session identifier
        #
        #   @return [String]
        required :session_id, String, api_name: :sessionId

        # @!attribute cdp_url
        #   CDP WebSocket URL for connecting to the Browserbase cloud browser (present when
        #   available)
        #
        #   @return [String, nil]
        optional :cdp_url, String, api_name: :cdpUrl, nil?: true

        # @!method initialize(available:, session_id:, cdp_url: nil)
        #   Some parameter documentations has been truncated, see
        #   {StagehandSDK::Models::SessionStartResponse::Data} for more details.
        #
        #   @param available [Boolean]
        #
        #   @param session_id [String] Unique Browserbase session identifier
        #
        #   @param cdp_url [String, nil] CDP WebSocket URL for connecting to the Browserbase cloud browser (present when
      end
    end
  end
end
