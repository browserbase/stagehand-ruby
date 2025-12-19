# typed: strong

module Stagehand
  module Internal
    class Stream
      Message =
        type_member(:in) do
          { fixed: Stagehand::Internal::Util::ServerSentEvent }
        end
      Elem = type_member(:out)

      include Stagehand::Internal::Type::BaseStream

      # @api private
      sig { override.returns(T::Enumerable[Elem]) }
      private def iterator
      end
    end
  end
end
