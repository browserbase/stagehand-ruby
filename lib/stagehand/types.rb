# frozen_string_literal: true

require_relative "types/base"
require_relative "types/action"
require_relative "types/model_config"
require_relative "types/log_line"
require_relative "types/session_start_response"
require_relative "types/session_act_response"
require_relative "types/session_extract_response"
require_relative "types/session_observe_response"
require_relative "types/session_navigate_response"
require_relative "types/session_execute_agent_response"
require_relative "types/session_end_response"

module Stagehand
  module Types
    # Environment enum
    module Env
      LOCAL = :LOCAL
      BROWSERBASE = :BROWSERBASE
    end

    # Wait until options for navigation
    module WaitUntil
      LOAD = :load
      DOM_CONTENT_LOADED = :domcontentloaded
      NETWORK_IDLE = :networkidle
    end

    # AI Provider options
    module Provider
      OPENAI = :openai
      ANTHROPIC = :anthropic
      GOOGLE = :google
    end
  end
end
