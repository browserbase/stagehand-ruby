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

      # Indicates whether the request was successful
      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Stagehand::Models::SessionObserveResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Indicates whether the request was successful
        success:
      )
      end

      sig do
        override.returns(
          {
            data: Stagehand::Models::SessionObserveResponse::Data,
            success: T::Boolean
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
    end
  end
end
