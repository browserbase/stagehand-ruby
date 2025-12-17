# typed: strong

module Stagehand
  module Models
    class SessionObserveResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionObserveResponse,
            Stagehand::Internal::AnyHash
          )
        end

      sig { returns(Stagehand::Models::SessionObserveResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: Stagehand::Models::SessionObserveResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      sig do
        returns(
          Stagehand::Models::SessionObserveResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      sig do
        params(
          data: Stagehand::Models::SessionObserveResponse::Data::OrHash,
          success: Stagehand::Models::SessionObserveResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, success:)
      end

      sig do
        override.returns(
          {
            data: Stagehand::Models::SessionObserveResponse::Data,
            success:
              Stagehand::Models::SessionObserveResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::Models::SessionObserveResponse::Data,
              Stagehand::Internal::AnyHash
            )
          end

        sig { returns(T::Array[Stagehand::Action]) }
        attr_accessor :result

        # Action ID for tracking
        sig { returns(T.nilable(String)) }
        attr_reader :action_id

        sig { params(action_id: String).void }
        attr_writer :action_id

        sig do
          params(
            result: T::Array[Stagehand::Action::OrHash],
            action_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          result:,
          # Action ID for tracking
          action_id: nil
        )
        end

        sig do
          override.returns(
            { result: T::Array[Stagehand::Action], action_id: String }
          )
        end
        def to_hash
        end
      end

      module Success
        extend Stagehand::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              Stagehand::Models::SessionObserveResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Stagehand::Models::SessionObserveResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::Models::SessionObserveResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
