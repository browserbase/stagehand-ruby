# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#act
    #
    # @see Stagehand::Resources::Sessions#act_streaming
    class SessionActResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [Stagehand::Models::SessionActResponse::Data]
      required :data, -> { Stagehand::Models::SessionActResponse::Data }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, Stagehand::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [Stagehand::Models::SessionActResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see Stagehand::Models::SessionActResponse#data
      class Data < Stagehand::Internal::Type::BaseModel
        # @!attribute result
        #
        #   @return [Stagehand::Models::SessionActResponse::Data::Result]
        required :result, -> { Stagehand::Models::SessionActResponse::Data::Result }

        # @!attribute action_id
        #   Action ID for tracking
        #
        #   @return [String, nil]
        optional :action_id, String, api_name: :actionId

        # @!method initialize(result:, action_id: nil)
        #   @param result [Stagehand::Models::SessionActResponse::Data::Result]
        #
        #   @param action_id [String] Action ID for tracking

        # @see Stagehand::Models::SessionActResponse::Data#result
        class Result < Stagehand::Internal::Type::BaseModel
          # @!attribute action_description
          #   Description of the action that was performed
          #
          #   @return [String]
          required :action_description, String, api_name: :actionDescription

          # @!attribute actions
          #   List of actions that were executed
          #
          #   @return [Array<Stagehand::Models::Action>]
          required :actions, -> { Stagehand::Internal::Type::ArrayOf[Stagehand::Action] }

          # @!attribute message
          #   Human-readable result message
          #
          #   @return [String]
          required :message, String

          # @!attribute success
          #   Whether the action completed successfully
          #
          #   @return [Boolean]
          required :success, Stagehand::Internal::Type::Boolean

          # @!method initialize(action_description:, actions:, message:, success:)
          #   @param action_description [String] Description of the action that was performed
          #
          #   @param actions [Array<Stagehand::Models::Action>] List of actions that were executed
          #
          #   @param message [String] Human-readable result message
          #
          #   @param success [Boolean] Whether the action completed successfully
        end
      end
    end
  end
end
