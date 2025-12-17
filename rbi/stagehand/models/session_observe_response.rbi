# typed: strong

module Stagehand
  module Models
    SessionObserveResponse =
      T.let(T.anything, Stagehand::Internal::Type::Converter)
  end
end
