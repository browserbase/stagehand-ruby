# typed: strong

module Stagehand
  module Models
    class SessionExecuteAgentResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionExecuteAgentResponse,
            Stagehand::Internal::AnyHash
          )
        end

      # Final message from the agent
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Steps taken by the agent
      sig { returns(T.nilable(T::Array[T.anything])) }
      attr_reader :steps

      sig { params(steps: T::Array[T.anything]).void }
      attr_writer :steps

      sig do
        params(message: String, steps: T::Array[T.anything]).returns(
          T.attached_class
        )
      end
      def self.new(
        # Final message from the agent
        message: nil,
        # Steps taken by the agent
        steps: nil
      )
      end

      sig { override.returns({ message: String, steps: T::Array[T.anything] }) }
      def to_hash
      end
    end
  end
end
