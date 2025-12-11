# typed: strong

module Stagehand
  module Models
    # Default extraction result
    module SessionExtractResponse
      extend Stagehand::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionExtractResponse::Extraction,
            T::Hash[Symbol, T.anything]
          )
        end

      class Extraction < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::Models::SessionExtractResponse::Extraction,
              Stagehand::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(String)) }
        attr_reader :extraction

        sig { params(extraction: String).void }
        attr_writer :extraction

        # Default extraction result
        sig { params(extraction: String).returns(T.attached_class) }
        def self.new(extraction: nil)
        end

        sig { override.returns({ extraction: String }) }
        def to_hash
        end
      end

      sig do
        override.returns(
          T::Array[Stagehand::Models::SessionExtractResponse::Variants]
        )
      end
      def self.variants
      end

      UnionMember1Map =
        T.let(
          Stagehand::Internal::Type::HashOf[Stagehand::Internal::Type::Unknown],
          Stagehand::Internal::Type::Converter
        )
    end
  end
end
