# typed: strong

module StagehandSDK
  module Models
    class SessionExecuteParams < StagehandSDK::Internal::Type::BaseModel
      extend StagehandSDK::Internal::Type::RequestParameters::Converter
      include StagehandSDK::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            StagehandSDK::SessionExecuteParams,
            StagehandSDK::Internal::AnyHash
          )
        end

      sig { returns(StagehandSDK::SessionExecuteParams::AgentConfig) }
      attr_reader :agent_config

      sig do
        params(
          agent_config: StagehandSDK::SessionExecuteParams::AgentConfig::OrHash
        ).void
      end
      attr_writer :agent_config

      sig { returns(StagehandSDK::SessionExecuteParams::ExecuteOptions) }
      attr_reader :execute_options

      sig do
        params(
          execute_options:
            StagehandSDK::SessionExecuteParams::ExecuteOptions::OrHash
        ).void
      end
      attr_writer :execute_options

      # Target frame ID for the agent
      sig { returns(T.nilable(String)) }
      attr_accessor :frame_id

      # Whether to stream the response via SSE
      sig do
        returns(
          T.nilable(
            StagehandSDK::SessionExecuteParams::XStreamResponse::OrSymbol
          )
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            StagehandSDK::SessionExecuteParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          agent_config: StagehandSDK::SessionExecuteParams::AgentConfig::OrHash,
          execute_options:
            StagehandSDK::SessionExecuteParams::ExecuteOptions::OrHash,
          frame_id: T.nilable(String),
          x_stream_response:
            StagehandSDK::SessionExecuteParams::XStreamResponse::OrSymbol,
          request_options: StagehandSDK::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        agent_config:,
        execute_options:,
        # Target frame ID for the agent
        frame_id: nil,
        # Whether to stream the response via SSE
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            agent_config: StagehandSDK::SessionExecuteParams::AgentConfig,
            execute_options: StagehandSDK::SessionExecuteParams::ExecuteOptions,
            frame_id: T.nilable(String),
            x_stream_response:
              StagehandSDK::SessionExecuteParams::XStreamResponse::OrSymbol,
            request_options: StagehandSDK::RequestOptions
          }
        )
      end
      def to_hash
      end

      class AgentConfig < StagehandSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              StagehandSDK::SessionExecuteParams::AgentConfig,
              StagehandSDK::Internal::AnyHash
            )
          end

        # Enable Computer Use Agent mode
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :cua

        sig { params(cua: T::Boolean).void }
        attr_writer :cua

        # Model name string with provider prefix. Always use the format
        # 'provider/model-name' (e.g., 'openai/gpt-4o',
        # 'anthropic/claude-sonnet-4-5-20250929', 'google/gemini-2.0-flash')
        sig do
          returns(
            T.nilable(
              T.any(String, StagehandSDK::ModelConfig::ModelConfigObject)
            )
          )
        end
        attr_reader :model

        sig do
          params(
            model:
              T.any(
                String,
                StagehandSDK::ModelConfig::ModelConfigObject::OrHash
              )
          ).void
        end
        attr_writer :model

        # AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        sig do
          returns(
            T.nilable(
              StagehandSDK::SessionExecuteParams::AgentConfig::Provider::OrSymbol
            )
          )
        end
        attr_reader :provider

        sig do
          params(
            provider:
              StagehandSDK::SessionExecuteParams::AgentConfig::Provider::OrSymbol
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
            model:
              T.any(
                String,
                StagehandSDK::ModelConfig::ModelConfigObject::OrHash
              ),
            provider:
              StagehandSDK::SessionExecuteParams::AgentConfig::Provider::OrSymbol,
            system_prompt: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Enable Computer Use Agent mode
          cua: nil,
          # Model name string with provider prefix. Always use the format
          # 'provider/model-name' (e.g., 'openai/gpt-4o',
          # 'anthropic/claude-sonnet-4-5-20250929', 'google/gemini-2.0-flash')
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
              model:
                T.any(String, StagehandSDK::ModelConfig::ModelConfigObject),
              provider:
                StagehandSDK::SessionExecuteParams::AgentConfig::Provider::OrSymbol,
              system_prompt: String
            }
          )
        end
        def to_hash
        end

        # AI provider for the agent (legacy, use model: openai/gpt-5-nano instead)
        module Provider
          extend StagehandSDK::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                StagehandSDK::SessionExecuteParams::AgentConfig::Provider
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OPENAI =
            T.let(
              :openai,
              StagehandSDK::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
            )
          ANTHROPIC =
            T.let(
              :anthropic,
              StagehandSDK::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
            )
          GOOGLE =
            T.let(
              :google,
              StagehandSDK::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
            )
          MICROSOFT =
            T.let(
              :microsoft,
              StagehandSDK::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                StagehandSDK::SessionExecuteParams::AgentConfig::Provider::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class ExecuteOptions < StagehandSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              StagehandSDK::SessionExecuteParams::ExecuteOptions,
              StagehandSDK::Internal::AnyHash
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
        extend StagehandSDK::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, StagehandSDK::SessionExecuteParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            StagehandSDK::SessionExecuteParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            StagehandSDK::SessionExecuteParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              StagehandSDK::SessionExecuteParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
