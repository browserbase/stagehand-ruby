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

      # Indicates whether the request was successful
      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Stagehand::Models::SessionStartResponse::Data::OrHash,
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
            data: Stagehand::Models::SessionStartResponse::Data,
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
              Stagehand::Models::SessionStartResponse::Data,
              Stagehand::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :available

        # CDP WebSocket URL for connecting to the Browserbase cloud browser
        sig { returns(String) }
        attr_accessor :connect_url

        # Unique Browserbase session identifier
        sig { returns(String) }
        attr_accessor :session_id

        sig do
          params(
            available: T::Boolean,
            connect_url: String,
            session_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          available:,
          # CDP WebSocket URL for connecting to the Browserbase cloud browser
          connect_url:,
          # Unique Browserbase session identifier
          session_id:
        )
        end

        sig do
          override.returns(
            { available: T::Boolean, connect_url: String, session_id: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
