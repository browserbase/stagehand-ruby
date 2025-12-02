# frozen_string_literal: true

require_relative "base"

module Stagehand
  module Types
    # Response from a navigate request
    class SessionNavigateResponse < Base
      attr_accessor :ok, :status, :url

      def initialize(attributes = {})
        @ok = attributes[:ok]
        @status = attributes[:status]
        @url = attributes[:url]
      end
    end
  end
end
