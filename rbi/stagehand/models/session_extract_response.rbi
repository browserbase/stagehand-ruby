# typed: strong

module Stagehand
  module Models
    SessionExtractResponse =
      T.let(T.anything, Stagehand::Internal::Type::Converter)
  end
end
