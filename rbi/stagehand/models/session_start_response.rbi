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

      sig { returns(Stagehand::Models::SessionStartResponse::Data) }
      attr_reader :data

      sig do
        params(data: Stagehand::Models::SessionStartResponse::Data::OrHash).void
      end
      attr_writer :data

      sig do
        returns(Stagehand::Models::SessionStartResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          data: Stagehand::Models::SessionStartResponse::Data::OrHash,
          success: Stagehand::Models::SessionStartResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, success:)
      end

      sig do
        override.returns(
          {
            data: Stagehand::Models::SessionStartResponse::Data,
            success:
              Stagehand::Models::SessionStartResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::Models::SessionStartResponse::Data,
              Stagehand::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :available

        # Unique session identifier
        sig { returns(String) }
        attr_accessor :session_id

        sig do
          params(available: T::Boolean, session_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          available:,
          # Unique session identifier
          session_id:
        )
        end

        sig { override.returns({ available: T::Boolean, session_id: String }) }
        def to_hash
        end
      end

      module Success
        extend Stagehand::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Stagehand::Models::SessionStartResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Stagehand::Models::SessionStartResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::Models::SessionStartResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
