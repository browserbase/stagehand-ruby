# frozen_string_literal: true

require_relative "base"

module Stagehand
  module Types
    # Response from an extract request
    class SessionExtractResponse < Base
      attr_accessor :extraction, :data

      def initialize(attributes = {})
        @extraction = attributes[:extraction]
        # If schema was provided, data might be structured differently
        @data = attributes[:data] || @extraction
      end
    end
  end
end
