# frozen_string_literal: true

module Stagehand
  # Base error class for all Stagehand errors
  class Error < StandardError; end

  # Raised when there's a connection error
  class ConnectionError < Error; end

  # Raised when the API returns an error response
  class APIError < Error
    attr_reader :status, :body

    def initialize(message = nil, status: nil, body: nil)
      @status = status
      @body = body
      super(message || "API Error: #{status}")
    end
  end

  # Raised when authentication fails
  class AuthenticationError < APIError; end

  # Raised when a resource is not found
  class NotFoundError < APIError; end

  # Raised when rate limited
  class RateLimitError < APIError; end

  # Raised when there's a validation error
  class ValidationError < APIError; end

  # Raised when the session is invalid or expired
  class SessionError < Error; end
end
