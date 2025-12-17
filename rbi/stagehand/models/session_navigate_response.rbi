# typed: strong

module Stagehand
  module Models
    SessionNavigateResponse =
      T.let(T.anything, Stagehand::Internal::Type::Converter)
  end
end
