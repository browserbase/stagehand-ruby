# frozen_string_literal: true

module Stagehand
  module Models
    # @see Stagehand::Resources::Sessions#start
    class SessionStartParams < Stagehand::Internal::Type::BaseModel
      extend Stagehand::Internal::Type::RequestParameters::Converter
      include Stagehand::Internal::Type::RequestParameters

      # @!attribute browserbase_api_key
      #   API key for Browserbase Cloud
      #
      #   @return [String]
      required :browserbase_api_key, String, api_name: :BROWSERBASE_API_KEY

      # @!attribute browserbase_project_id
      #   Project ID for Browserbase
      #
      #   @return [String]
      required :browserbase_project_id, String, api_name: :BROWSERBASE_PROJECT_ID

      # @!attribute dom_settle_timeout
      #   Timeout in ms to wait for DOM to settle
      #
      #   @return [Integer, nil]
      optional :dom_settle_timeout, Integer, api_name: :domSettleTimeout

      # @!attribute model
      #   AI model to use for actions (must be prefixed with provider/)
      #
      #   @return [String, nil]
      optional :model, String

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

      # @!method initialize(browserbase_api_key:, browserbase_project_id:, dom_settle_timeout: nil, model: nil, self_heal: nil, system_prompt: nil, verbose: nil, request_options: {})
      #   @param browserbase_api_key [String] API key for Browserbase Cloud
      #
      #   @param browserbase_project_id [String] Project ID for Browserbase
      #
      #   @param dom_settle_timeout [Integer] Timeout in ms to wait for DOM to settle
      #
      #   @param model [String] AI model to use for actions (must be prefixed with provider/)
      #
      #   @param self_heal [Boolean] Enable self-healing for failed actions
      #
      #   @param system_prompt [String] Custom system prompt for AI actions
      #
      #   @param verbose [Integer] Logging verbosity level
      #
      #   @param request_options [Stagehand::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
