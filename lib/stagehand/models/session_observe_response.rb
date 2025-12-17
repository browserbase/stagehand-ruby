# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#observe
    class SessionObserveResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Stagehand::Models::SessionObserveResponse::Data]
      required :data, -> { Stagehand::Models::SessionObserveResponse::Data }

      # @!attribute success
      #
      #   @return [Boolean, Stagehand::Models::SessionObserveResponse::Success]
      required :success, enum: -> { Stagehand::Models::SessionObserveResponse::Success }

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionObserveResponse::Data]
      #   @param success [Boolean, Stagehand::Models::SessionObserveResponse::Success]

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

      # @see Stagehand::Models::SessionObserveResponse#success
      module Success
        extend Stagehand::Internal::Type::Enum

        TRUE = true

        # @!method self.values
        #   @return [Array<Boolean>]
      end
    end
  end
end
