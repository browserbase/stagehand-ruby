# frozen_string_literal: true

require_relative "base"

module Stagehand
  module Types
    # Log line from SSE stream
    class LogLine < Base
      attr_accessor :category, :message, :auxiliary

      def initialize(attributes = {})
        @category = attributes[:category]
        @message = attributes[:message]
        @auxiliary = attributes[:auxiliary]
      end
    end
  end
end
