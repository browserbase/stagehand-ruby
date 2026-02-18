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
            T::Array[Stagehand::Models::SessionReplayResponse::Data::Page]
          )
        end
        attr_accessor :pages

        sig { returns(T.nilable(String)) }
        attr_reader :client_language

        sig { params(client_language: String).void }
        attr_writer :client_language

        sig do
          params(
            pages:
              T::Array[
                Stagehand::Models::SessionReplayResponse::Data::Page::OrHash
              ],
            client_language: String
          ).returns(T.attached_class)
        end
        def self.new(pages:, client_language: nil)
        end

        sig do
          override.returns(
            {
              pages:
                T::Array[Stagehand::Models::SessionReplayResponse::Data::Page],
              client_language: String
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
              T::Array[
                Stagehand::Models::SessionReplayResponse::Data::Page::Action
              ]
            )
          end
          attr_accessor :actions

          sig { returns(Float) }
          attr_accessor :duration

          sig { returns(Float) }
          attr_accessor :timestamp

          sig { returns(String) }
          attr_accessor :url

          sig do
            params(
              actions:
                T::Array[
                  Stagehand::Models::SessionReplayResponse::Data::Page::Action::OrHash
                ],
              duration: Float,
              timestamp: Float,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(actions:, duration:, timestamp:, url:)
          end

          sig do
            override.returns(
              {
                actions:
                  T::Array[
                    Stagehand::Models::SessionReplayResponse::Data::Page::Action
                  ],
                duration: Float,
                timestamp: Float,
                url: String
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

            sig { returns(String) }
            attr_accessor :method_

            sig { returns(T::Hash[Symbol, T.anything]) }
            attr_accessor :parameters

            sig { returns(T::Hash[Symbol, T.anything]) }
            attr_accessor :result

            sig { returns(Float) }
            attr_accessor :timestamp

            sig { returns(T.nilable(Float)) }
            attr_reader :end_time

            sig { params(end_time: Float).void }
            attr_writer :end_time

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
                parameters: T::Hash[Symbol, T.anything],
                result: T::Hash[Symbol, T.anything],
                timestamp: Float,
                end_time: Float,
                token_usage:
                  Stagehand::Models::SessionReplayResponse::Data::Page::Action::TokenUsage::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              method_:,
              parameters:,
              result:,
              timestamp:,
              end_time: nil,
              token_usage: nil
            )
            end

            sig do
              override.returns(
                {
                  method_: String,
                  parameters: T::Hash[Symbol, T.anything],
                  result: T::Hash[Symbol, T.anything],
                  timestamp: Float,
                  end_time: Float,
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
              attr_reader :cost

              sig { params(cost: Float).void }
              attr_writer :cost

              sig { returns(T.nilable(Float)) }
              attr_reader :input_tokens

              sig { params(input_tokens: Float).void }
              attr_writer :input_tokens

              sig { returns(T.nilable(Float)) }
              attr_reader :output_tokens

              sig { params(output_tokens: Float).void }
              attr_writer :output_tokens

              sig { returns(T.nilable(Float)) }
              attr_reader :time_ms

              sig { params(time_ms: Float).void }
              attr_writer :time_ms

              sig do
                params(
                  cost: Float,
                  input_tokens: Float,
                  output_tokens: Float,
                  time_ms: Float
                ).returns(T.attached_class)
              end
              def self.new(
                cost: nil,
                input_tokens: nil,
                output_tokens: nil,
                time_ms: nil
              )
              end

              sig do
                override.returns(
                  {
                    cost: Float,
                    input_tokens: Float,
                    output_tokens: Float,
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
