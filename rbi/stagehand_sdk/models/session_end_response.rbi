# typed: strong

module StagehandSDK
  module Models
    class SessionEndResponse < StagehandSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            StagehandSDK::Models::SessionEndResponse,
            StagehandSDK::Internal::AnyHash
          )
        end

      # Indicates whether the request was successful
      sig { returns(T::Boolean) }
      attr_accessor :success

      sig { params(success: T::Boolean).returns(T.attached_class) }
      def self.new(
        # Indicates whether the request was successful
        success:
      )
      end

      sig { override.returns({ success: T::Boolean }) }
      def to_hash
      end
    end
  end
end
