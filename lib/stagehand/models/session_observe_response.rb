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
        #   @return [Array<Stagehand::Models::SessionObserveResponse::Data::Result>]
        required :result,
                 -> { Stagehand::Internal::Type::ArrayOf[Stagehand::Models::SessionObserveResponse::Data::Result] }

        # @!attribute action_id
        #   Action ID for tracking
        #
        #   @return [String, nil]
        optional :action_id, String, api_name: :actionId

        # @!method initialize(result:, action_id: nil)
        #   @param result [Array<Stagehand::Models::SessionObserveResponse::Data::Result>]
        #
        #   @param action_id [String] Action ID for tracking

        class Result < Stagehand::Internal::Type::BaseModel
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
          optional :arguments, Stagehand::Internal::Type::ArrayOf[String]

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
