# typed: strong

module Stagehand
  module Models
    class SessionActResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionActResponse,
            Stagehand::Internal::AnyHash
          )
        end

      # Actions that were executed
      sig { returns(T::Array[Stagehand::Action]) }
      attr_accessor :actions

      # Result message
      sig { returns(String) }
      attr_accessor :message

      # Whether the action succeeded
      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          actions: T::Array[Stagehand::Action::OrHash],
          message: String,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # Actions that were executed
        actions:,
        # Result message
        message:,
        # Whether the action succeeded
        success:
      )
      end

      sig do
        override.returns(
          {
            actions: T::Array[Stagehand::Action],
            message: String,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end
    end
  end
end
