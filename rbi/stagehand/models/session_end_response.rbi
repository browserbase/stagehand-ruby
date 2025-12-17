# typed: strong

module Stagehand
  module Models
    class SessionEndResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionEndResponse,
            Stagehand::Internal::AnyHash
          )
        end

      sig do
        returns(Stagehand::Models::SessionEndResponse::Success::TaggedBoolean)
      end
      attr_accessor :success

      sig do
        params(
          success: Stagehand::Models::SessionEndResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(success:)
      end

      sig do
        override.returns(
          {
            success:
              Stagehand::Models::SessionEndResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      module Success
        extend Stagehand::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(T::Boolean, Stagehand::Models::SessionEndResponse::Success)
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Stagehand::Models::SessionEndResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::Models::SessionEndResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
