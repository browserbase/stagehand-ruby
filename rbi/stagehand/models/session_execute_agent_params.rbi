# typed: strong

module Stagehand
  module Models
    class SessionExecuteAgentParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Stagehand::SessionExecuteAgentParams,
            Stagehand::Internal::AnyHash
          )
        end

      sig { returns(Stagehand::SessionExecuteAgentParams::AgentConfig) }
      attr_reader :agent_config

      sig do
        params(
          agent_config:
            Stagehand::SessionExecuteAgentParams::AgentConfig::OrHash
        ).void
      end
      attr_writer :agent_config

      sig { returns(Stagehand::SessionExecuteAgentParams::ExecuteOptions) }
      attr_reader :execute_options

      sig do
        params(
          execute_options:
            Stagehand::SessionExecuteAgentParams::ExecuteOptions::OrHash
        ).void
      end
      attr_writer :execute_options

      sig { returns(T.nilable(String)) }
      attr_reader :frame_id

      sig { params(frame_id: String).void }
      attr_writer :frame_id

      sig do
        returns(
          T.nilable(
            Stagehand::SessionExecuteAgentParams::XStreamResponse::OrSymbol
          )
        )
      end
      attr_reader :x_stream_response

      sig do
        params(
          x_stream_response:
            Stagehand::SessionExecuteAgentParams::XStreamResponse::OrSymbol
        ).void
      end
      attr_writer :x_stream_response

      sig do
        params(
          agent_config:
            Stagehand::SessionExecuteAgentParams::AgentConfig::OrHash,
          execute_options:
            Stagehand::SessionExecuteAgentParams::ExecuteOptions::OrHash,
          frame_id: String,
          x_stream_response:
            Stagehand::SessionExecuteAgentParams::XStreamResponse::OrSymbol,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        agent_config:,
        execute_options:,
        frame_id: nil,
        x_stream_response: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            agent_config: Stagehand::SessionExecuteAgentParams::AgentConfig,
            execute_options:
              Stagehand::SessionExecuteAgentParams::ExecuteOptions,
            frame_id: String,
            x_stream_response:
              Stagehand::SessionExecuteAgentParams::XStreamResponse::OrSymbol,
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
              Stagehand::SessionExecuteAgentParams::AgentConfig,
              Stagehand::Internal::AnyHash
            )
          end

        # Enable Computer Use Agent mode
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :cua

        sig { params(cua: T::Boolean).void }
        attr_writer :cua

        sig { returns(T.nilable(T.any(String, Stagehand::ModelConfig))) }
        attr_reader :model

        sig do
          params(model: T.any(String, Stagehand::ModelConfig::OrHash)).void
        end
        attr_writer :model

        sig do
          returns(
            T.nilable(
              Stagehand::SessionExecuteAgentParams::AgentConfig::Provider::OrSymbol
            )
          )
        end
        attr_reader :provider

        sig do
          params(
            provider:
              Stagehand::SessionExecuteAgentParams::AgentConfig::Provider::OrSymbol
          ).void
        end
        attr_writer :provider

        sig { returns(T.nilable(String)) }
        attr_reader :system_prompt

        sig { params(system_prompt: String).void }
        attr_writer :system_prompt

        sig do
          params(
            cua: T::Boolean,
            model: T.any(String, Stagehand::ModelConfig::OrHash),
            provider:
              Stagehand::SessionExecuteAgentParams::AgentConfig::Provider::OrSymbol,
            system_prompt: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Enable Computer Use Agent mode
          cua: nil,
          model: nil,
          provider: nil,
          system_prompt: nil
        )
        end

        sig do
          override.returns(
            {
              cua: T::Boolean,
              model: T.any(String, Stagehand::ModelConfig),
              provider:
                Stagehand::SessionExecuteAgentParams::AgentConfig::Provider::OrSymbol,
              system_prompt: String
            }
          )
        end
        def to_hash
        end

        module Model
          extend Stagehand::Internal::Type::Union

          Variants = T.type_alias { T.any(String, Stagehand::ModelConfig) }

          sig do
            override.returns(
              T::Array[
                Stagehand::SessionExecuteAgentParams::AgentConfig::Model::Variants
              ]
            )
          end
          def self.variants
          end
        end

        module Provider
          extend Stagehand::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Stagehand::SessionExecuteAgentParams::AgentConfig::Provider
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OPENAI =
            T.let(
              :openai,
              Stagehand::SessionExecuteAgentParams::AgentConfig::Provider::TaggedSymbol
            )
          ANTHROPIC =
            T.let(
              :anthropic,
              Stagehand::SessionExecuteAgentParams::AgentConfig::Provider::TaggedSymbol
            )
          GOOGLE =
            T.let(
              :google,
              Stagehand::SessionExecuteAgentParams::AgentConfig::Provider::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Stagehand::SessionExecuteAgentParams::AgentConfig::Provider::TaggedSymbol
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
              Stagehand::SessionExecuteAgentParams::ExecuteOptions,
              Stagehand::Internal::AnyHash
            )
          end

        # Task for the agent to complete
        sig { returns(String) }
        attr_accessor :instruction

        # Visually highlight the cursor during actions
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :highlight_cursor

        sig { params(highlight_cursor: T::Boolean).void }
        attr_writer :highlight_cursor

        # Maximum number of steps the agent can take
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_steps

        sig { params(max_steps: Integer).void }
        attr_writer :max_steps

        sig do
          params(
            instruction: String,
            highlight_cursor: T::Boolean,
            max_steps: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Task for the agent to complete
          instruction:,
          # Visually highlight the cursor during actions
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
              max_steps: Integer
            }
          )
        end
        def to_hash
        end
      end

      module XStreamResponse
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Stagehand::SessionExecuteAgentParams::XStreamResponse)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TRUE =
          T.let(
            :true,
            Stagehand::SessionExecuteAgentParams::XStreamResponse::TaggedSymbol
          )
        FALSE =
          T.let(
            :false,
            Stagehand::SessionExecuteAgentParams::XStreamResponse::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Stagehand::SessionExecuteAgentParams::XStreamResponse::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
