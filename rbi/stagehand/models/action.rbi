# typed: strong

module Stagehand
  module Models
    class Action < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Stagehand::Action, Stagehand::Internal::AnyHash) }

      # Human-readable description of the action
      sig { returns(String) }
      attr_accessor :description

      # CSS selector or XPath for the element
      sig { returns(String) }
      attr_accessor :selector

      # Arguments to pass to the method
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :arguments

      sig { params(arguments: T::Array[String]).void }
      attr_writer :arguments

      # The method to execute (click, fill, etc.)
      sig { returns(T.nilable(String)) }
      attr_reader :method_

      sig { params(method_: String).void }
      attr_writer :method_

      # Action object returned by observe and used by act
      sig do
        params(
          description: String,
          selector: String,
          arguments: T::Array[String],
          method_: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Human-readable description of the action
        description:,
        # CSS selector or XPath for the element
        selector:,
        # Arguments to pass to the method
        arguments: nil,
        # The method to execute (click, fill, etc.)
        method_: nil
      )
      end

      sig do
        override.returns(
          {
            description: String,
            selector: String,
            arguments: T::Array[String],
            method_: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
