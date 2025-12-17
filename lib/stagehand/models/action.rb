# frozen_string_literal: true

module Stagehand
  module Models
    class Action < Stagehand::Internal::Type::BaseModel
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

      # @!attribute method_
      #   The method to execute (click, fill, etc.)
      #
      #   @return [String, nil]
      optional :method_, String, api_name: :method

      # @!method initialize(description:, selector:, arguments: nil, method_: nil)
      #   Action object returned by observe and used by act
      #
      #   @param description [String] Human-readable description of the action
      #
      #   @param selector [String] CSS selector or XPath for the element
      #
      #   @param arguments [Array<String>] Arguments to pass to the method
      #
      #   @param method_ [String] The method to execute (click, fill, etc.)
    end
  end
end
