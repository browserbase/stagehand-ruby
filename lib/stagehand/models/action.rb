# frozen_string_literal: true

module Stagehand
  module Models
    class Action < Stagehand::Internal::Type::BaseModel
      # @!attribute arguments
      #   Arguments for the method
      #
      #   @return [Array<String>]
      required :arguments, Stagehand::Internal::Type::ArrayOf[String]

      # @!attribute description
      #   Human-readable description of the action
      #
      #   @return [String]
      required :description, String

      # @!attribute method_
      #   Method to execute (e.g., "click", "fill")
      #
      #   @return [String]
      required :method_, String, api_name: :method

      # @!attribute selector
      #   CSS or XPath selector for the element
      #
      #   @return [String]
      required :selector, String

      # @!attribute backend_node_id
      #   CDP backend node ID
      #
      #   @return [Integer, nil]
      optional :backend_node_id, Integer, api_name: :backendNodeId

      # @!method initialize(arguments:, description:, method_:, selector:, backend_node_id: nil)
      #   @param arguments [Array<String>] Arguments for the method
      #
      #   @param description [String] Human-readable description of the action
      #
      #   @param method_ [String] Method to execute (e.g., "click", "fill")
      #
      #   @param selector [String] CSS or XPath selector for the element
      #
      #   @param backend_node_id [Integer] CDP backend node ID
    end
  end
end
