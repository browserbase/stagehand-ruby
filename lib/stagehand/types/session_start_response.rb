# frozen_string_literal: true

require_relative "base"

module Stagehand
  module Types
    # Response from starting a session
    class SessionStartResponse < Base
      attr_accessor :session_id, :available

      def initialize(attributes = {})
        @session_id = attributes[:sessionId] || attributes[:session_id]
        @available = attributes[:available]
      end
    end
  end
end
