# typed: strong

module Stagehand
  module Models
    class SessionEndParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionEndParams, Stagehand::Internal::AnyHash)
        end

      sig do
        params(request_options: Stagehand::RequestOptions::OrHash).returns(
          T.attached_class
        )
      end
      def self.new(request_options: {})
      end

      sig { override.returns({ request_options: Stagehand::RequestOptions }) }
      def to_hash
      end
    end
  end
end
