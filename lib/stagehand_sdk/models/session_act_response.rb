# frozen_string_literal: true

module StagehandSDK
  module Models
    # @see StagehandSDK::Resources::Sessions#act
    #
    # @see StagehandSDK::Resources::Sessions#act_streaming
    class SessionActResponse < StagehandSDK::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [StagehandSDK::Models::SessionActResponse::Data]
      required :data, -> { StagehandSDK::Models::SessionActResponse::Data }

      # @!attribute success
      #   Indicates whether the request was successful
      #
      #   @return [Boolean]
      required :success, StagehandSDK::Internal::Type::Boolean

      # @!method initialize(data:, success:)
      #   @param data [StagehandSDK::Models::SessionActResponse::Data]
      #
      #   @param success [Boolean] Indicates whether the request was successful

      # @see StagehandSDK::Models::SessionActResponse#data
      class Data < StagehandSDK::Internal::Type::BaseModel
        # @!attribute result
        #
        #   @return [StagehandSDK::Models::SessionActResponse::Data::Result]
        required :result, -> { StagehandSDK::Models::SessionActResponse::Data::Result }

        # @!attribute action_id
        #   Action ID for tracking
        #
        #   @return [String, nil]
        optional :action_id, String, api_name: :actionId

        # @!method initialize(result:, action_id: nil)
        #   @param result [StagehandSDK::Models::SessionActResponse::Data::Result]
        #
        #   @param action_id [String] Action ID for tracking

        # @see StagehandSDK::Models::SessionActResponse::Data#result
        class Result < StagehandSDK::Internal::Type::BaseModel
          # @!attribute action_description
          #   Description of the action that was performed
          #
          #   @return [String]
          required :action_description, String, api_name: :actionDescription

          # @!attribute actions
          #   List of actions that were executed
          #
          #   @return [Array<StagehandSDK::Models::SessionActResponse::Data::Result::Action>]
          required :actions,
                   -> { StagehandSDK::Internal::Type::ArrayOf[StagehandSDK::Models::SessionActResponse::Data::Result::Action] }

          # @!attribute message
          #   Human-readable result message
          #
          #   @return [String]
          required :message, String

          # @!attribute success
          #   Whether the action completed successfully
          #
          #   @return [Boolean]
          required :success, StagehandSDK::Internal::Type::Boolean

          # @!method initialize(action_description:, actions:, message:, success:)
          #   @param action_description [String] Description of the action that was performed
          #
          #   @param actions [Array<StagehandSDK::Models::SessionActResponse::Data::Result::Action>] List of actions that were executed
          #
          #   @param message [String] Human-readable result message
          #
          #   @param success [Boolean] Whether the action completed successfully

          class Action < StagehandSDK::Internal::Type::BaseModel
            # @!attribute description
            #   Human-readable description of the action
            #
            #   @return [String]
            required :description, String

            # @!attribute selector
            #   CSS selector or XPath for the element
            #
            #   @return [String]
            required :selector, String

            # @!attribute arguments
            #   Arguments to pass to the method
            #
            #   @return [Array<String>, nil]
            optional :arguments, StagehandSDK::Internal::Type::ArrayOf[String]

            # @!attribute backend_node_id
            #   Backend node ID for the element
            #
            #   @return [Float, nil]
            optional :backend_node_id, Float, api_name: :backendNodeId

            # @!attribute method_
            #   The method to execute (click, fill, etc.)
            #
            #   @return [String, nil]
            optional :method_, String, api_name: :method

            # @!method initialize(description:, selector:, arguments: nil, backend_node_id: nil, method_: nil)
            #   Action object returned by observe and used by act
            #
            #   @param description [String] Human-readable description of the action
            #
            #   @param selector [String] CSS selector or XPath for the element
            #
            #   @param arguments [Array<String>] Arguments to pass to the method
            #
            #   @param backend_node_id [Float] Backend node ID for the element
            #
            #   @param method_ [String] The method to execute (click, fill, etc.)
          end
        end
      end
    end
  end
end
