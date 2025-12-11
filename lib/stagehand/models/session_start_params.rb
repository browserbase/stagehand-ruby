# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#start
    class SessionStartParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute env
      #   Environment to run the browser in
      #
      #   @return [Symbol, Stagehand::Models::SessionStartParams::Env]
      required :env, enum: -> { Stagehand::SessionStartParams::Env }

      # @!attribute api_key
      #   API key for Browserbase (required when env=BROWSERBASE)
      #
      #   @return [String, nil]
      optional :api_key, String, api_name: :apiKey

      # @!attribute dom_settle_timeout
      #   Timeout in ms to wait for DOM to settle
      #
      #   @return [Integer, nil]
      optional :dom_settle_timeout, Integer, api_name: :domSettleTimeout

      # @!attribute local_browser_launch_options
      #   Options for local browser launch
      #
      #   @return [Stagehand::Models::SessionStartParams::LocalBrowserLaunchOptions, nil]
      optional :local_browser_launch_options,
               -> { Stagehand::SessionStartParams::LocalBrowserLaunchOptions },
               api_name: :localBrowserLaunchOptions

      # @!attribute model
      #   AI model to use for actions
      #
      #   @return [String, nil]
      optional :model, String

      # @!attribute project_id
      #   Project ID for Browserbase (required when env=BROWSERBASE)
      #
      #   @return [String, nil]
      optional :project_id, String, api_name: :projectId

      # @!attribute self_heal
      #   Enable self-healing for failed actions
      #
      #   @return [Boolean, nil]
      optional :self_heal, Stagehand::Internal::Type::Boolean, api_name: :selfHeal

      # @!attribute system_prompt
      #   Custom system prompt for AI actions
      #
      #   @return [String, nil]
      optional :system_prompt, String, api_name: :systemPrompt

      # @!attribute verbose
      #   Logging verbosity level
      #
      #   @return [Integer, nil]
      optional :verbose, Integer

      # @!method initialize(env:, api_key: nil, dom_settle_timeout: nil, local_browser_launch_options: nil, model: nil, project_id: nil, self_heal: nil, system_prompt: nil, verbose: nil, request_options: {})
      #   @param env [Symbol, Stagehand::Models::SessionStartParams::Env] Environment to run the browser in
      #
      #   @param api_key [String] API key for Browserbase (required when env=BROWSERBASE)
      #
      #   @param dom_settle_timeout [Integer] Timeout in ms to wait for DOM to settle
      #
      #   @param local_browser_launch_options [Stagehand::Models::SessionStartParams::LocalBrowserLaunchOptions] Options for local browser launch
      #
      #   @param model [String] AI model to use for actions
      #
      #   @param project_id [String] Project ID for Browserbase (required when env=BROWSERBASE)
      #
      #   @param self_heal [Boolean] Enable self-healing for failed actions
      #
      #   @param system_prompt [String] Custom system prompt for AI actions
      #
      #   @param verbose [Integer] Logging verbosity level
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]

      # Environment to run the browser in
      module Env
        extend Stagehand::Internal::Type::Enum

        LOCAL = :LOCAL
        BROWSERBASE = :BROWSERBASE

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class LocalBrowserLaunchOptions < Stagehand::Internal::Type::BaseModel
        # @!attribute headless
        #
        #   @return [Boolean, nil]
        optional :headless, Stagehand::Internal::Type::Boolean

        # @!method initialize(headless: nil)
        #   Options for local browser launch
        #
        #   @param headless [Boolean]
      end
    end
  end
end
