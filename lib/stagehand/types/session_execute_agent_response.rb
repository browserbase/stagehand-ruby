# frozen_string_literal: true

require_relative "base"

module Stagehand
  module Types
    # Response from an agent execute request
    class SessionExecuteAgentResponse < Base
      attr_accessor :message, :steps

      def initialize(attributes = {})
        @message = attributes[:message]
        @steps = attributes[:steps] || []
      end
    end
  end
end
