# frozen_string_literal: true

require_relative "base"
require_relative "action"

module Stagehand
  module Types
    # Response from an observe request - returns list of actions
    class SessionObserveResponse < Base
      attr_accessor :actions

      def initialize(attributes = {})
        # The response is an array of actions
        if attributes.is_a?(Array)
          @actions = attributes.map { |a| Action.new(a) }
        else
          @actions = (attributes[:actions] || []).map { |a| Action.new(a) }
        end
      end

      def each(&block)
        @actions.each(&block)
      end

      def [](index)
        @actions[index]
      end

      def size
        @actions.size
      end
      alias length size
    end
  end
end
