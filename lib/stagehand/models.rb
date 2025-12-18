# frozen_string_literal: true

module Stagehand
  [Stagehand::Internal::Type::BaseModel, *Stagehand::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Stagehand::Internal::AnyHash) } }
  end

  Stagehand::Internal::Util.walk_namespaces(Stagehand::Models).each do |mod|
    case mod
    in Stagehand::Internal::Type::Enum | Stagehand::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Stagehand::Internal::Util.walk_namespaces(Stagehand::Models)
                           .lazy
                           .grep(Stagehand::Internal::Type::Union)
                           .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Action = Stagehand::Models::Action

  ModelConfig = Stagehand::Models::ModelConfig

  SessionActParams = Stagehand::Models::SessionActParams

  SessionEndParams = Stagehand::Models::SessionEndParams

  SessionExecuteParams = Stagehand::Models::SessionExecuteParams

  SessionExtractParams = Stagehand::Models::SessionExtractParams

  SessionNavigateParams = Stagehand::Models::SessionNavigateParams

  SessionObserveParams = Stagehand::Models::SessionObserveParams

  SessionStartParams = Stagehand::Models::SessionStartParams

  StreamEvent = Stagehand::Models::StreamEvent
end
