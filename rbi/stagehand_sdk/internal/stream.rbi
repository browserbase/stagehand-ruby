# typed: strong

module StagehandSDK
  module Internal
    class Stream
      Message =
        type_member(:in) do
          { fixed: StagehandSDK::Internal::Util::ServerSentEvent }
        end
      Elem = type_member(:out)

      include StagehandSDK::Internal::Type::BaseStream

      # @api private
      sig { override.returns(T::Enumerable[Elem]) }
      private def iterator
      end
    end
  end
end
