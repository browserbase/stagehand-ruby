# typed: strong

module Stagehand
  module Models
    class SessionReplayResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionReplayResponse,
            Stagehand::Internal::AnyHash
          )
        end

      sig { returns(Stagehand::Models::SessionReplayResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: Stagehand::Models::SessionReplayResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      # Indicates whether the request was successful
      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Stagehand::Models::SessionReplayResponse::Data::OrHash,
          success: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        data:,
        # Indicates whether the request was successful
        success:
      )
      end

      sig do
        override.returns(
          {
            data: Stagehand::Models::SessionReplayResponse::Data,
            success: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Data < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::Models::SessionReplayResponse::Data,
              Stagehand::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.nilable(
              T::Array[Stagehand::Models::SessionReplayResponse::Data::Page]
            )
          )
        end
        attr_reader :pages

        sig do
          params(
            pages:
              T::Array[
                Stagehand::Models::SessionReplayResponse::Data::Page::OrHash
              ]
          ).void
        end
        attr_writer :pages

        sig do
          params(
            pages:
              T::Array[
                Stagehand::Models::SessionReplayResponse::Data::Page::OrHash
              ]
          ).returns(T.attached_class)
        end
        def self.new(pages: nil)
        end

        sig do
          override.returns(
            {
              pages:
                T::Array[Stagehand::Models::SessionReplayResponse::Data::Page]
            }
          )
        end
        def to_hash
        end

        class Page < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::Models::SessionReplayResponse::Data::Page,
                Stagehand::Internal::AnyHash
              )
            end

          sig do
            returns(
              T.nilable(
                T::Array[
                  Stagehand::Models::SessionReplayResponse::Data::Page::Action
                ]
              )
            )
          end
          attr_reader :actions

          sig do
            params(
              actions:
                T::Array[
                  Stagehand::Models::SessionReplayResponse::Data::Page::Action::OrHash
                ]
            ).void
          end
          attr_writer :actions

          sig do
            params(
              actions:
                T::Array[
                  Stagehand::Models::SessionReplayResponse::Data::Page::Action::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(actions: nil)
          end

          sig do
            override.returns(
              {
                actions:
                  T::Array[
                    Stagehand::Models::SessionReplayResponse::Data::Page::Action
                  ]
              }
            )
          end
          def to_hash
          end

          class Action < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::Models::SessionReplayResponse::Data::Page::Action,
                  Stagehand::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(String)) }
            attr_reader :method_

            sig { params(method_: String).void }
            attr_writer :method_

            sig do
              returns(
                T.nilable(
                  Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage
                )
              )
            end
            attr_reader :token_usage

            sig do
              params(
                token_usage:
                  Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage::OrHash
              ).void
            end
            attr_writer :token_usage

            sig do
              params(
                method_: String,
                token_usage:
                  Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage::OrHash
              ).returns(T.attached_class)
            end
            def self.new(method_: nil, token_usage: nil)
            end

            sig do
              override.returns(
                {
                  method_: String,
                  token_usage:
                    Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage
                }
              )
            end
            def to_hash
            end

            class TokenUsage < Stagehand::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage,
                    Stagehand::Internal::AnyHash
                  )
                end

              sig { returns(T.nilable(Float)) }
              attr_reader :cached_input_tokens

              sig { params(cached_input_tokens: Float).void }
              attr_writer :cached_input_tokens

              sig { returns(T.nilable(Float)) }
              attr_reader :input_tokens

              sig { params(input_tokens: Float).void }
              attr_writer :input_tokens

              sig { returns(T.nilable(Float)) }
              attr_reader :output_tokens

              sig { params(output_tokens: Float).void }
              attr_writer :output_tokens

              sig { returns(T.nilable(Float)) }
              attr_reader :reasoning_tokens

              sig { params(reasoning_tokens: Float).void }
              attr_writer :reasoning_tokens

              sig { returns(T.nilable(Float)) }
              attr_reader :time_ms

              sig { params(time_ms: Float).void }
              attr_writer :time_ms

              sig do
                params(
                  cached_input_tokens: Float,
                  input_tokens: Float,
                  output_tokens: Float,
                  reasoning_tokens: Float,
                  time_ms: Float
                ).returns(T.attached_class)
              end
              def self.new(
                cached_input_tokens: nil,
                input_tokens: nil,
                output_tokens: nil,
                reasoning_tokens: nil,
                time_ms: nil
              )
              end

              sig do
                override.returns(
                  {
                    cached_input_tokens: Float,
                    input_tokens: Float,
                    output_tokens: Float,
                    reasoning_tokens: Float,
                    time_ms: Float
                  }
                )
              end
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
