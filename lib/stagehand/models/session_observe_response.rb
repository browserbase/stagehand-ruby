# frozen_string_literal: true

module Stagehand
  module Models
    # @type [Stagehand::Internal::Type::Converter]
    SessionObserveResponse = Stagehand::Internal::Type::ArrayOf[-> { Stagehand::Action }]
  end
end
