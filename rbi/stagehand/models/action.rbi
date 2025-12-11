# typed: strong

module Stagehand
  module Models
    class Action < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Stagehand::Action, Stagehand::Internal::AnyHash) }

      # Arguments for the method
      sig { returns(T::Array[String]) }
      attr_accessor :arguments

      # Human-readable description of the action
      sig { returns(String) }
      attr_accessor :description

      # Method to execute (e.g., "click", "fill")
      sig { returns(String) }
      attr_accessor :method_

      # CSS or XPath selector for the element
      sig { returns(String) }
      attr_accessor :selector

      # CDP backend node ID
      sig { returns(T.nilable(Integer)) }
      attr_reader :backend_node_id

      sig { params(backend_node_id: Integer).void }
      attr_writer :backend_node_id

      sig do
        params(
          arguments: T::Array[String],
          description: String,
          method_: String,
          selector: String,
          backend_node_id: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        # Arguments for the method
        arguments:,
        # Human-readable description of the action
        description:,
        # Method to execute (e.g., "click", "fill")
        method_:,
        # CSS or XPath selector for the element
        selector:,
        # CDP backend node ID
        backend_node_id: nil
      )
      end

      sig do
        override.returns(
          {
            arguments: T::Array[String],
            description: String,
            method_: String,
            selector: String,
            backend_node_id: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
