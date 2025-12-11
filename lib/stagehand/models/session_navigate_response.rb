# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#navigate
    class SessionNavigateResponse < Stagehand::Internal::Type::BaseModel
      # @!attribute ok
      #
      #   @return [Boolean, nil]
      optional :ok, Stagehand::Internal::Type::Boolean

      # @!attribute status
      #
      #   @return [Integer, nil]
      optional :status, Integer

      # @!attribute url
      #
      #   @return [String, nil]
      optional :url, String

      # @!method initialize(ok: nil, status: nil, url: nil)
      #   Navigation response (may be null)
      #
      #   @param ok [Boolean]
      #   @param status [Integer]
      #   @param url [String]
    end
  end
end
