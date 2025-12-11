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

      # Environment to run the browser in
      sig { returns(Stagehand::SessionStartParams::Env::OrSymbol) }
      attr_accessor :env

      # API key for Browserbase (required when env=BROWSERBASE)
      sig { returns(T.nilable(String)) }
      attr_reader :api_key

      sig { params(api_key: String).void }
      attr_writer :api_key

      # Timeout in ms to wait for DOM to settle
      sig { returns(T.nilable(Integer)) }
      attr_reader :dom_settle_timeout

      sig { params(dom_settle_timeout: Integer).void }
      attr_writer :dom_settle_timeout

      # Options for local browser launch
      sig do
        returns(
          T.nilable(Stagehand::SessionStartParams::LocalBrowserLaunchOptions)
        )
      end
      attr_reader :local_browser_launch_options

      sig do
        params(
          local_browser_launch_options:
            Stagehand::SessionStartParams::LocalBrowserLaunchOptions::OrHash
        ).void
      end
      attr_writer :local_browser_launch_options

      # AI model to use for actions
      sig { returns(T.nilable(String)) }
      attr_reader :model

      sig { params(model: String).void }
      attr_writer :model

      # Project ID for Browserbase (required when env=BROWSERBASE)
      sig { returns(T.nilable(String)) }
      attr_reader :project_id

      sig { params(project_id: String).void }
      attr_writer :project_id

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
          env: Stagehand::SessionStartParams::Env::OrSymbol,
          api_key: String,
          dom_settle_timeout: Integer,
          local_browser_launch_options:
            Stagehand::SessionStartParams::LocalBrowserLaunchOptions::OrHash,
          model: String,
          project_id: String,
          self_heal: T::Boolean,
          system_prompt: String,
          verbose: Integer,
          request_options: Stagehand::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Environment to run the browser in
        env:,
        # API key for Browserbase (required when env=BROWSERBASE)
        api_key: nil,
        # Timeout in ms to wait for DOM to settle
        dom_settle_timeout: nil,
        # Options for local browser launch
        local_browser_launch_options: nil,
        # AI model to use for actions
        model: nil,
        # Project ID for Browserbase (required when env=BROWSERBASE)
        project_id: nil,
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
            env: Stagehand::SessionStartParams::Env::OrSymbol,
            api_key: String,
            dom_settle_timeout: Integer,
            local_browser_launch_options:
              Stagehand::SessionStartParams::LocalBrowserLaunchOptions,
            model: String,
            project_id: String,
            self_heal: T::Boolean,
            system_prompt: String,
            verbose: Integer,
            request_options: Stagehand::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Environment to run the browser in
      module Env
        extend Stagehand::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Stagehand::SessionStartParams::Env) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        LOCAL = T.let(:LOCAL, Stagehand::SessionStartParams::Env::TaggedSymbol)
        BROWSERBASE =
          T.let(:BROWSERBASE, Stagehand::SessionStartParams::Env::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Stagehand::SessionStartParams::Env::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class LocalBrowserLaunchOptions < Stagehand::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Stagehand::SessionStartParams::LocalBrowserLaunchOptions,
              Stagehand::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :headless

        sig { params(headless: T::Boolean).void }
        attr_writer :headless

        # Options for local browser launch
        sig { params(headless: T::Boolean).returns(T.attached_class) }
        def self.new(headless: nil)
        end

        sig { override.returns({ headless: T::Boolean }) }
        def to_hash
        end
      end
    end
  end
end
