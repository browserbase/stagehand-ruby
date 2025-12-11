# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#end_
    class SessionEndParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!method initialize(request_options: {})
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
