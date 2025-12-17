# typed: strong

module Stagehand
  module Models
    SessionExecuteAgentResponse =
      T.let(T.anything, Stagehand::Internal::Type::Converter)
  end
end
