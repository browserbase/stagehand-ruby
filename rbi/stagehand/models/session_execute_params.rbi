# typed: strong

module Stagehand
  module Models
    class SessionExecuteParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionExecuteParams, Stagehand::Internal::AnyHash)
        end

      sig { returns(Stagehand::SessionExecuteParams::AgentConfig) }
      attr_reader :agent_config

      sig do
        params(
          agent_config: Stagehand::SessionExecuteParams::AgentConfig::OrHash
        ).void
      end
      attr_writer :agent_config

      sig { returns(Stagehand::SessionExecuteParams::ExecuteOptions) }
      attr_reader :execute_options

      sig do
        params(
          execute_options:
            Stagehand::SessionExecuteParams::ExecuteOptions::OrHash
        ).void
      end
      attr_writer :execute_options

      # Target frame ID for the agent
      sig { returns(T.nilable(String)) }
      attr_accessor :frame_id

      # If true, the server captures a cache entry and returns it to the client
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :should_cache

      sig { params(should_cache: T::Boolean).void }
      attr_writer :should_cache

      # Whether to stream the response via SSE
      sig do
        returns(
          T.nilable(Stagehand::SessionExecuteParams::XStreamResponse::OrSymbol)
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            Stagehand::SessionExecuteParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          agent_config: Stagehand::SessionExecuteParams::AgentConfig::OrHash,
          execute_options:
            Stagehand::SessionExecuteParams::ExecuteOptions::OrHash,
          frame_id: T.nilable(String),
          should_cache: T::Boolean,
          x_stream_response:
            Stagehand::SessionExecuteParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        agent_config:,
        execute_options:,
        # Target frame ID for the agent
        frame_id: nil,
        # If true, the server captures a cache entry and returns it to the client
        should_cache: nil,
        # Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            agent_config: Stagehand::SessionExecuteParams::AgentConfig,
            execute_options: Stagehand::SessionExecuteParams::ExecuteOptions,
            frame_id: T.nilable(String),
            should_cache: T::Boolean,
            x_stream_response:
              Stagehand::SessionExecuteParams::XStreamResponse::OrSymbol,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end

      class AgentConfig < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::SessionExecuteParams::AgentConfig,
              Stagehand::Internal::AnyHash
            )
          end

        # Enable Computer Use Agent mode
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :cua

        sig { params(cua: T::Boolean).void }
        attr_writer :cua

        sig { returns(T.nilable(Stagehand::ModelConfig)) }
        attr_reader :model

        sig { params(model: Stagehand::ModelConfig::OrHash).void }
        attr_writer :model

        # AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        sig do
          returns(
            T.nilable(
              Stagehand::SessionExecuteParams::AgentConfig::Provider::OrSymbol
            )
          )
        end
        attr_reader :provider

        sig do
          params(
            provider:
              Stagehand::SessionExecuteParams::AgentConfig::Provider::OrSymbol
          ).void
        end
        attr_writer :provider

        # Custom system prompt for the agent
        sig { returns(T.nilable(String)) }
        attr_reader :system_prompt

        sig { params(system_prompt: String).void }
        attr_writer :system_prompt

        sig do
          params(
            cua: T::Boolean,
            model: Stagehand::ModelConfig::OrHash,
            provider:
              Stagehand::SessionExecuteParams::AgentConfig::Provider::OrSymbol,
            system_prompt: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Enable Computer Use Agent mode
          cua: nil,
          model: nil,
          # AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
          provider: nil,
          # Custom system prompt for the agent
          system_prompt: nil
        )
        end

        sig do
          override.returns(
            {
              cua: T::Boolean,
              model: Stagehand::ModelConfig,
              provider:
                Stagehand::SessionExecuteParams::AgentConfig::Provider::OrSymbol,
              system_prompt: String
            }
          )
        end
        def to_hash
        end

        # AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        module Provider
          extend Stagehand::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Stagehand::SessionExecuteParams::AgentConfig::Provider
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OPENAI =
            T.let(
              :openai,
              Stagehand::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
            )
          ANTHROPIC =
            T.let(
              :anthropic,
              Stagehand::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
            )
          GOOGLE =
            T.let(
              :google,
              Stagehand::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
            )
          MICROSOFT =
            T.let(
              :microsoft,
              Stagehand::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Stagehand::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class ExecuteOptions < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::SessionExecuteParams::ExecuteOptions,
              Stagehand::Internal::AnyHash
            )
          end

        # Natural language instruction for the agent
        sig { returns(String) }
        attr_accessor :instruction

        # Whether to visually highlight the cursor during execution
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :highlight_cursor

        sig { params(highlight_cursor: T::Boolean).void }
        attr_writer :highlight_cursor

        # Maximum number of steps the agent can take
        sig { returns(T.nilable(Float)) }
        attr_reader :max_steps

        sig { params(max_steps: Float).void }
        attr_writer :max_steps

        sig do
          params(
            instruction: String,
            highlight_cursor: T::Boolean,
            max_steps: Float
          ).returns(T.attached_class)
        end
        def self.new(
          # Natural language instruction for the agent
          instruction:,
          # Whether to visually highlight the cursor during execution
          highlight_cursor: nil,
          # Maximum number of steps the agent can take
          max_steps: nil
        )
        end

        sig do
          override.returns(
            {
              instruction: String,
              highlight_cursor: T::Boolean,
              max_steps: Float
            }
          )
        end
        def to_hash
        end
      end

      # Whether to stream the response via SSE
      module XStreamResponse
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Stagehand::SessionExecuteParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Stagehand::SessionExecuteParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Stagehand::SessionExecuteParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::SessionExecuteParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
