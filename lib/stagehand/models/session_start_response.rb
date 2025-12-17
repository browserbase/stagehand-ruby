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
      #
      #   @return [Boolean, Stagehand::Models::SessionStartResponse::Success]
      required :success, enum: -> { Stagehand::Models::SessionStartResponse::Success }

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionStartResponse::Data]
      #   @param success [Boolean, Stagehand::Models::SessionStartResponse::Success]

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

      # @see Stagehand::Models::SessionStartResponse#success
      module Success
        extend Stagehand::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
