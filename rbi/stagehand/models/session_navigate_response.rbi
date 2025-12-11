# typed: strong

module Stagehand
  module Models
    class SessionNavigateResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionNavigateResponse,
            Stagehand::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :ok

      sig { params(ok: T::Boolean).void }
      attr_writer :ok

      sig { returns(T.nilable(Integer)) }
      attr_reader :status

      sig { params(status: Integer).void }
      attr_writer :status

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      # Navigation response (may be null)
      sig do
        params(ok: T::Boolean, status: Integer, url: String).returns(
          T.attached_class
        )
      end
      def self.new(ok: nil, status: nil, url: nil)
      end

      sig { override.returns({ ok: T::Boolean, status: Integer, url: String }) }
      def to_hash
      end
    end
  end
end
