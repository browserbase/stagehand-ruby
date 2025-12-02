# frozen_string_literal: true

require_relative "base"
require_relative "action"

module Stagehand
  module Types
    # Response from an act request
    class SessionActResponse < Base
      attr_accessor :success, :message, :actions

      def initialize(attributes = {})
        @success = attributes[:success]
        @message = attributes[:message]
        @actions = (attributes[:actions] || []).map { |a| Action.new(a) }
      end
    end
  end
end
