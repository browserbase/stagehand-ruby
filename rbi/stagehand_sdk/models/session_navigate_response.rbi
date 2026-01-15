# typed: strong

module StagehandSDK
  module Models
    class SessionNavigateResponse < StagehandSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            StagehandSDK::Models::SessionNavigateResponse,
            StagehandSDK::Internal::AnyHash
          )
        end

      sig { returns(StagehandSDK::Models::SessionNavigateResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: StagehandSDK::Models::SessionNavigateResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      # Indicates whether the request was successful
      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: StagehandSDK::Models::SessionNavigateResponse::Data::OrHash,
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
            data: StagehandSDK::Models::SessionNavigateResponse::Data,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < StagehandSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              StagehandSDK::Models::SessionNavigateResponse::Data,
              StagehandSDK::Internal::AnyHash
            )
          end

        # Navigation response (Playwright Response object or null)
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
          # Navigation response (Playwright Response object or null)
          result:,
          # Action ID for tracking
          action_id: nil
        )
        end

        sig { override.returns({ result: T.anything, action_id: String }) }
        def to_hash
        end
      end
    end
  end
end
