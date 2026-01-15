# typed: strong

module StagehandSDK
  module Models
    class SessionStartResponse < StagehandSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            StagehandSDK::Models::SessionStartResponse,
            StagehandSDK::Internal::AnyHash
          )
        end

      sig { returns(StagehandSDK::Models::SessionStartResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: StagehandSDK::Models::SessionStartResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      # Indicates whether the request was successful
      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: StagehandSDK::Models::SessionStartResponse::Data::OrHash,
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
            data: StagehandSDK::Models::SessionStartResponse::Data,
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
              StagehandSDK::Models::SessionStartResponse::Data,
              StagehandSDK::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :available

        # Unique Browserbase session identifier
        sig { returns(String) }
        attr_accessor :session_id

        # CDP WebSocket URL for connecting to the Browserbase cloud browser (present when
        # available)
        sig { returns(T.nilable(String)) }
        attr_accessor :cdp_url

        sig do
          params(
            available: T::Boolean,
            session_id: String,
            cdp_url: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          available:,
          # Unique Browserbase session identifier
          session_id:,
          # CDP WebSocket URL for connecting to the Browserbase cloud browser (present when
          # available)
          cdp_url: nil
        )
        end

        sig do
          override.returns(
            {
              available: T::Boolean,
              session_id: String,
              cdp_url: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
