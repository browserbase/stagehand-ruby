# typed: strong

module Stagehand
  module Models
    module ModelConfig
      extend Stagehand::Internal::Type::Union

      Variants =
        T.type_alias { T.any(String, Stagehand::ModelConfig::UnionMember1) }

      class UnionMember1 < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::ModelConfig::UnionMember1,
              Stagehand::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :model_name

        sig { returns(T.nilable(String)) }
        attr_reader :api_key

        sig { params(api_key: String).void }
        attr_writer :api_key

        sig { returns(T.nilable(String)) }
        attr_reader :base_url

        sig { params(base_url: String).void }
        attr_writer :base_url

        sig do
          params(model_name: String, api_key: String, base_url: String).returns(
            T.attached_class
          )
        end
        def self.new(model_name:, api_key: nil, base_url: nil)
        end

        sig do
          override.returns(
            { model_name: String, api_key: String, base_url: String }
          )
        end
        def to_hash
        end
      end

      sig { override.returns(T::Array[Stagehand::ModelConfig::Variants]) }
      def self.variants
      end
    end
  end
end
