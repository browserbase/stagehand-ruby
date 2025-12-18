# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#observe
    #
    # @see Stagehand::Resources::Sessions#observe_streaming
    class SessionObserveResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Stagehand::Models::SessionObserveResponse::Data]
      required :data, -> { Stagehand::Models::SessionObserveResponse::Data }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, Stagehand::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionObserveResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Stagehand::Models::SessionObserveResponse#data
      class Data < Stagehand::Internal::Type::BaseModel
        # @!attribute result
        #
        #   @return [Array<Stagehand::Models::Action>]
        required :result, -> { Stagehand::Internal::Type::ArrayOf[Stagehand::Action] }

        # @!attribute action_id
        #   Action ID for tracking
        #
        #   @return [String, nil]
        optional :action_id, String, api_name: :actionId

        # @!method initialize(result:, action_id: nil)
        #   @param result [Array<Stagehand::Models::Action>]
        #
        #   @param action_id [String] Action ID for tracking
      end
    end
  end
end
