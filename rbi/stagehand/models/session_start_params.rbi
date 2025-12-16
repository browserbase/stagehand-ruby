# typed: strong

module Stagehand
  module Models
    class SessionStartParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Stagehand::SessionStartParams, Stagehand::Internal::AnyHash)
        end

      # API key for Browserbase Cloud
      sig { returns(String) }
      attr_accessor :browserbase_api_key

      # Project ID for Browserbase
      sig { returns(String) }
      attr_accessor :browserbase_project_id

      # Timeout in ms to wait for DOM to settle
      sig { returns(T.nilable(Integer)) }
      attr_reader :dom_settle_timeout

      sig { params(dom_settle_timeout: Integer).void }
      attr_writer :dom_settle_timeout

      # AI model to use for actions (must be prefixed with provider/)
      sig { returns(T.nilable(String)) }
      attr_reader :model

      sig { params(model: String).void }
      attr_writer :model

      # Enable self-healing for failed actions
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :self_heal

      sig { params(self_heal: T::Boolean).void }
      attr_writer :self_heal

      # Custom system prompt for AI actions
      sig { returns(T.nilable(String)) }
      attr_reader :system_prompt

      sig { params(system_prompt: String).void }
      attr_writer :system_prompt

      # Logging verbosity level
      sig { returns(T.nilable(Integer)) }
      attr_reader :verbose

      sig { params(verbose: Integer).void }
      attr_writer :verbose

      sig do
        params(
          browserbase_api_key: String,
          browserbase_project_id: String,
          dom_settle_timeout: Integer,
          model: String,
          self_heal: T::Boolean,
          system_prompt: String,
          verbose: Integer,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # API key for Browserbase Cloud
        browserbase_api_key:,
        # Project ID for Browserbase
        browserbase_project_id:,
        # Timeout in ms to wait for DOM to settle
        dom_settle_timeout: nil,
        # AI model to use for actions (must be prefixed with provider/)
        model: nil,
        # Enable self-healing for failed actions
        self_heal: nil,
        # Custom system prompt for AI actions
        system_prompt: nil,
        # Logging verbosity level
        verbose: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            browserbase_api_key: String,
            browserbase_project_id: String,
            dom_settle_timeout: Integer,
            model: String,
            self_heal: T::Boolean,
            system_prompt: String,
            verbose: Integer,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
