# frozen_string_literal: true

require_relative "base"

module Stagehand
  module Types
    # Response from ending a session
    class SessionEndResponse < Base
      attr_accessor :success

      def initialize(attributes = {})
        @success = attributes[:success]
      end
    end
  end
end
