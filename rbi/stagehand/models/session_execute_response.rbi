# typed: strong

module Stagehand
  module Models
    class SessionExecuteResponse < Stagehand::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Stagehand::Models::SessionExecuteResponse,
            Stagehand::Internal::AnyHash
          )
        end

      sig { returns(Stagehand::Models::SessionExecuteResponse::Data) }
      attr_reader :data

      sig do
        params(
          data: Stagehand::Models::SessionExecuteResponse::Data::OrHash
        ).void
      end
      attr_writer :data

      # Indicates whether the request was successful
      sig { returns(T::Boolean) }
      attr_accessor :success

      sig do
        params(
          data: Stagehand::Models::SessionExecuteResponse::Data::OrHash,
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
            data: Stagehand::Models::SessionExecuteResponse::Data,
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
              Stagehand::Models::SessionExecuteResponse::Data,
              Stagehand::Internal::AnyHash
            )
          end

        sig { returns(Stagehand::Models::SessionExecuteResponse::Data::Result) }
        attr_reader :result

        sig do
          params(
            result:
              Stagehand::Models::SessionExecuteResponse::Data::Result::OrHash
          ).void
        end
        attr_writer :result

        sig do
          returns(
            T.nilable(
              Stagehand::Models::SessionExecuteResponse::Data::CacheEntry
            )
          )
        end
        attr_reader :cache_entry

        sig do
          params(
            cache_entry:
              Stagehand::Models::SessionExecuteResponse::Data::CacheEntry::OrHash
          ).void
        end
        attr_writer :cache_entry

        sig do
          params(
            result:
              Stagehand::Models::SessionExecuteResponse::Data::Result::OrHash,
            cache_entry:
              Stagehand::Models::SessionExecuteResponse::Data::CacheEntry::OrHash
          ).returns(T.attached_class)
        end
        def self.new(result:, cache_entry: nil)
        end

        sig do
          override.returns(
            {
              result: Stagehand::Models::SessionExecuteResponse::Data::Result,
              cache_entry:
                Stagehand::Models::SessionExecuteResponse::Data::CacheEntry
            }
          )
        end
        def to_hash
        end

        class Result < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::Models::SessionExecuteResponse::Data::Result,
                Stagehand::Internal::AnyHash
              )
            end

          sig do
            returns(
              T::Array[
                Stagehand::Models::SessionExecuteResponse::Data::Result::Action
              ]
            )
          end
          attr_accessor :actions

          # Whether the agent finished its task
          sig { returns(T::Boolean) }
          attr_accessor :completed

          # Summary of what the agent accomplished
          sig { returns(String) }
          attr_accessor :message

          # Whether the agent completed successfully
          sig { returns(T::Boolean) }
          attr_accessor :success

          sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
          attr_reader :metadata

          sig { params(metadata: T::Hash[Symbol, T.anything]).void }
          attr_writer :metadata

          sig do
            returns(
              T.nilable(
                Stagehand::Models::SessionExecuteResponse::Data::Result::Usage
              )
            )
          end
          attr_reader :usage

          sig do
            params(
              usage:
                Stagehand::Models::SessionExecuteResponse::Data::Result::Usage::OrHash
            ).void
          end
          attr_writer :usage

          sig do
            params(
              actions:
                T::Array[
                  Stagehand::Models::SessionExecuteResponse::Data::Result::Action::OrHash
                ],
              completed: T::Boolean,
              message: String,
              success: T::Boolean,
              metadata: T::Hash[Symbol, T.anything],
              usage:
                Stagehand::Models::SessionExecuteResponse::Data::Result::Usage::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            actions:,
            # Whether the agent finished its task
            completed:,
            # Summary of what the agent accomplished
            message:,
            # Whether the agent completed successfully
            success:,
            metadata: nil,
            usage: nil
          )
          end

          sig do
            override.returns(
              {
                actions:
                  T::Array[
                    Stagehand::Models::SessionExecuteResponse::Data::Result::Action
                  ],
                completed: T::Boolean,
                message: String,
                success: T::Boolean,
                metadata: T::Hash[Symbol, T.anything],
                usage:
                  Stagehand::Models::SessionExecuteResponse::Data::Result::Usage
              }
            )
          end
          def to_hash
          end

          class Action < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::Models::SessionExecuteResponse::Data::Result::Action,
                  Stagehand::Internal::AnyHash
                )
              end

            # Type of action taken
            sig { returns(String) }
            attr_accessor :type

            sig { returns(T.nilable(String)) }
            attr_reader :action

            sig { params(action: String).void }
            attr_writer :action

            sig { returns(T.nilable(String)) }
            attr_reader :instruction

            sig { params(instruction: String).void }
            attr_writer :instruction

            sig { returns(T.nilable(String)) }
            attr_reader :page_text

            sig { params(page_text: String).void }
            attr_writer :page_text

            sig { returns(T.nilable(String)) }
            attr_reader :page_url

            sig { params(page_url: String).void }
            attr_writer :page_url

            # Agent's reasoning for taking this action
            sig { returns(T.nilable(String)) }
            attr_reader :reasoning

            sig { params(reasoning: String).void }
            attr_writer :reasoning

            sig { returns(T.nilable(T::Boolean)) }
            attr_reader :task_completed

            sig { params(task_completed: T::Boolean).void }
            attr_writer :task_completed

            # Time taken for this action in ms
            sig { returns(T.nilable(Float)) }
            attr_reader :time_ms

            sig { params(time_ms: Float).void }
            attr_writer :time_ms

            sig do
              params(
                type: String,
                action: String,
                instruction: String,
                page_text: String,
                page_url: String,
                reasoning: String,
                task_completed: T::Boolean,
                time_ms: Float
              ).returns(T.attached_class)
            end
            def self.new(
              # Type of action taken
              type:,
              action: nil,
              instruction: nil,
              page_text: nil,
              page_url: nil,
              # Agent's reasoning for taking this action
              reasoning: nil,
              task_completed: nil,
              # Time taken for this action in ms
              time_ms: nil
            )
            end

            sig do
              override.returns(
                {
                  type: String,
                  action: String,
                  instruction: String,
                  page_text: String,
                  page_url: String,
                  reasoning: String,
                  task_completed: T::Boolean,
                  time_ms: Float
                }
              )
            end
            def to_hash
            end
          end

          class Usage < Stagehand::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Stagehand::Models::SessionExecuteResponse::Data::Result::Usage,
                  Stagehand::Internal::AnyHash
                )
              end

            sig { returns(Float) }
            attr_accessor :inference_time_ms

            sig { returns(Float) }
            attr_accessor :input_tokens

            sig { returns(Float) }
            attr_accessor :output_tokens

            sig { returns(T.nilable(Float)) }
            attr_reader :cached_input_tokens

            sig { params(cached_input_tokens: Float).void }
            attr_writer :cached_input_tokens

            sig { returns(T.nilable(Float)) }
            attr_reader :reasoning_tokens

            sig { params(reasoning_tokens: Float).void }
            attr_writer :reasoning_tokens

            sig do
              params(
                inference_time_ms: Float,
                input_tokens: Float,
                output_tokens: Float,
                cached_input_tokens: Float,
                reasoning_tokens: Float
              ).returns(T.attached_class)
            end
            def self.new(
              inference_time_ms:,
              input_tokens:,
              output_tokens:,
              cached_input_tokens: nil,
              reasoning_tokens: nil
            )
            end

            sig do
              override.returns(
                {
                  inference_time_ms: Float,
                  input_tokens: Float,
                  output_tokens: Float,
                  cached_input_tokens: Float,
                  reasoning_tokens: Float
                }
              )
            end
            def to_hash
            end
          end
        end

        class CacheEntry < Stagehand::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Stagehand::Models::SessionExecuteResponse::Data::CacheEntry,
                Stagehand::Internal::AnyHash
              )
            end

          # Opaque cache identifier computed from instruction, URL, options, and config
          sig { returns(String) }
          attr_accessor :cache_key

          # Serialized cache entry that can be written to disk
          sig { returns(T.anything) }
          attr_accessor :entry

          sig do
            params(cache_key: String, entry: T.anything).returns(
              T.attached_class
            )
          end
          def self.new(
            # Opaque cache identifier computed from instruction, URL, options, and config
            cache_key:,
            # Serialized cache entry that can be written to disk
            entry:
          )
          end

          sig { override.returns({ cache_key: String, entry: T.anything }) }
          def to_hash
          end
        end
      end
    end
  end
end
