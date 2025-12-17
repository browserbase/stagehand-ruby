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
      attr_reader :frame_id

      sig { params(frame_id: String).void }
      attr_writer :frame_id

      # Client SDK language
      sig do
        returns(T.nilable(Stagehand::SessionExecuteParams::XLanguage::OrSymbol))
      end
      attr_reader :x_language

      sig do
        params(
          x_language: Stagehand::SessionExecuteParams::XLanguage::OrSymbol
        ).void
      end
      attr_writer :x_language

      # Version of the Stagehand SDK
      sig { returns(T.nilable(String)) }
      attr_reader :x_sdk_version

      sig { params(x_sdk_version: String).void }
      attr_writer :x_sdk_version

      # ISO timestamp when request was sent
      sig { returns(T.nilable(Time)) }
      attr_reader :x_sent_at

      sig { params(x_sent_at: Time).void }
      attr_writer :x_sent_at

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
          frame_id: String,
          x_language: Stagehand::SessionExecuteParams::XLanguage::OrSymbol,
          x_sdk_version: String,
          x_sent_at: Time,
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
        # Client SDK language
        x_language: nil,
        # Version of the Stagehand SDK
        x_sdk_version: nil,
        # ISO timestamp when request was sent
        x_sent_at: nil,
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
            frame_id: String,
            x_language: Stagehand::SessionExecuteParams::XLanguage::OrSymbol,
            x_sdk_version: String,
            x_sent_at: Time,
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

        # Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
        # 'anthropic/claude-4.5-opus')
        sig do
          returns(
            T.nilable(T.any(String, Stagehand::ModelConfig::ModelConfigObject))
          )
        end
        attr_reader :model

        sig do
          params(
            model:
              T.any(String, Stagehand::ModelConfig::ModelConfigObject::OrHash)
          ).void
        end
        attr_writer :model

        # Custom system prompt for the agent
        sig { returns(T.nilable(String)) }
        attr_reader :system_prompt

        sig { params(system_prompt: String).void }
        attr_writer :system_prompt

        sig do
          params(
            cua: T::Boolean,
            model:
              T.any(String, Stagehand::ModelConfig::ModelConfigObject::OrHash),
            system_prompt: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Enable Computer Use Agent mode
          cua: nil,
          # Model name string with provider prefix (e.g., 'openai/gpt-5-nano',
          # 'anthropic/claude-4.5-opus')
          model: nil,
          # Custom system prompt for the agent
          system_prompt: nil
        )
        end

        sig do
          override.returns(
            {
              cua: T::Boolean,
              model: T.any(String, Stagehand::ModelConfig::ModelConfigObject),
              system_prompt: String
            }
          )
        end
        def to_hash
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

      # Client SDK language
      module XLanguage
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Stagehand::SessionExecuteParams::XLanguage)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TYPESCRIPT =
          T.let(
            :typescript,
            Stagehand::SessionExecuteParams::XLanguage::TaggedSymbol
          )
        PYTHON =
          T.let(
            :python,
            Stagehand::SessionExecuteParams::XLanguage::TaggedSymbol
          )
        PLAYGROUND =
          T.let(
            :playground,
            Stagehand::SessionExecuteParams::XLanguage::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Stagehand::SessionExecuteParams::XLanguage::TaggedSymbol]
          )
        end
        def self.values
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
