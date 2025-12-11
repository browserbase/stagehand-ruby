# typed: strong

module Stagehand
  module Models
    SessionObserveResponse =
      T.let(
        Stagehand::Internal::Type::ArrayOf[Stagehand::Action],
        Stagehand::Internal::Type::Converter
      )
  end
end
