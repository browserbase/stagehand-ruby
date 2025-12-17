# typed: strong

module Stagehand
  module Models
    class SessionExtractResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionExtractResponse,
            Stagehand::Internal::AnyHash
          )
        end

      sig { returns(Stagehand::Models::SessionExtractResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: Stagehand::Models::SessionExtractResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      sig do
        returns(
          Stagehand::Models::SessionExtractResponse::Success::TaggedBoolean
        )
      end
      attr_accessor :success

      sig do
        params(
          data: Stagehand::Models::SessionExtractResponse::Data::OrHash,
          success: Stagehand::Models::SessionExtractResponse::Success::OrBoolean
        ).returns(T.attached_class)
      end
      def self.new(data:, success:)
      end

      sig do
        override.returns(
          {
            data: Stagehand::Models::SessionExtractResponse::Data,
            success:
              Stagehand::Models::SessionExtractResponse::Success::TaggedBoolean
          }
        )
      end
      def to_hash
      end

      class Data < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::Models::SessionExtractResponse::Data,
              Stagehand::Internal::AnyHash
            )
          end

        # Extracted data matching the requested schema
        sig { returns(T.anything) }
        attr_accessor :result

        # Action ID for tracking
        sig { returns(T.nilable(String)) }
        attr_reader :action_id

        sig { params(action_id: String).void }
        attr_writer :action_id

        sig do
          params(result: T.anything, action_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Extracted data matching the requested schema
          result:,
          # Action ID for tracking
          action_id: nil
        )
        end

        sig { override.returns({ result: T.anything, action_id: String }) }
        def to_hash
        end
      end

      module Success
        extend Stagehand::Internal::Type::Enum

        TaggedBoolean =
          T.type_alias do
            T.all(
              T::Boolean,
              Stagehand::Models::SessionExtractResponse::Success
            )
          end
        OrBoolean = T.type_alias { T::Boolean }

        TRUE =
          T.let(
            true,
            Stagehand::Models::SessionExtractResponse::Success::TaggedBoolean
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::Models::SessionExtractResponse::Success::TaggedBoolean
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
