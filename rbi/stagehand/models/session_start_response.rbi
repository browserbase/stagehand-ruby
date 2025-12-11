# typed: strong

module Stagehand
  module Models
    class SessionStartResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionStartResponse,
            Stagehand::Internal::AnyHash
          )
        end

      # Whether the session is ready to use
      sig { returns(T::Boolean) }
      attr_accessor :available

      # Unique identifier for the session
      sig { returns(String) }
      attr_accessor :session_id

      sig do
        params(available: T::Boolean, session_id: String).returns(
          T.attached_class
        )
      end
      def self.new(
        # Whether the session is ready to use
        available:,
        # Unique identifier for the session
        session_id:
      )
      end

      sig { override.returns({ available: T::Boolean, session_id: String }) }
      def to_hash
      end
    end
  end
end
