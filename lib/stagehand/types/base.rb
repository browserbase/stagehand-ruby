# frozen_string_literal: true

module Stagehand
  module Types
    # Base class for response types
    class Base
      def initialize(attributes = {})
        attributes.each do |key, value|
          setter = "#{key}="
          send(setter, value) if respond_to?(setter)
        end
      end

      def to_h
        instance_variables.each_with_object({}) do |var, hash|
          key = var.to_s.delete("@").to_sym
          hash[key] = instance_variable_get(var)
        end
      end

      def to_json(*args)
        to_h.to_json(*args)
      end
    end
  end
end
