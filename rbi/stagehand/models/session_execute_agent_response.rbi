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

      sig { params(message: String).returns(T.attached_class) }
      def self.new(
        # Final message from the agent
        message: nil
      )
      end

      sig { override.returns({ message: String }) }
      def to_hash
      end
    end
  end
end
