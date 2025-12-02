# frozen_string_literal: true

require_relative "base"

module Stagehand
  module Types
    # Represents a browser action
    class Action < Base
      attr_accessor :method, :selector, :arguments, :description, :backend_node_id

      def initialize(attributes = {})
        # Handle both camelCase and snake_case
        @method = attributes[:method]
        @selector = attributes[:selector]
        @arguments = attributes[:arguments] || []
        @description = attributes[:description]
        @backend_node_id = attributes[:backendNodeId] || attributes[:backend_node_id]
      end
    end
  end
end
