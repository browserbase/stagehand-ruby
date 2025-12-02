# frozen_string_literal: true

require_relative "base"

module Stagehand
  module Types
    # Configuration for AI models
    class ModelConfig < Base
      attr_accessor :model, :api_key, :base_url, :provider

      PROVIDERS = %i[openai anthropic google].freeze

      def initialize(attributes = {})
        if attributes.is_a?(String)
          @model = attributes
        else
          @model = attributes[:model]
          @api_key = attributes[:api_key] || attributes[:apiKey]
          @base_url = attributes[:base_url] || attributes[:baseUrl]
          @provider = attributes[:provider]&.to_sym
        end
      end

      def to_h
        hash = {}
        hash[:model] = @model if @model
        hash[:apiKey] = @api_key if @api_key
        hash[:baseUrl] = @base_url if @base_url
        hash[:provider] = @provider if @provider
        hash
      end
    end
  end
end
