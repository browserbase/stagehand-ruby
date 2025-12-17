# typed: strong

module Stagehand
  module Models
    SessionStartResponse =
      T.let(T.anything, Stagehand::Internal::Type::Converter)
  end
end
