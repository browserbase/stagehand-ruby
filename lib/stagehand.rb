# frozen_string_literal: true

# Standard libraries.
# rubocop:disable Lint/RedundantRequireStatement
require "English"
require "base64"
require "cgi"
require "date"
require "erb"
require "etc"
require "json"
require "net/http"
require "openssl"
require "pathname"
require "rbconfig"
require "securerandom"
require "set"
require "stringio"
require "time"
require "uri"
# rubocop:enable Lint/RedundantRequireStatement

# We already ship the preferred sorbet manifests in the package itself.
# `tapioca` currently does not offer us a way to opt out of unnecessary compilation.
if Object.const_defined?(:Tapioca) &&
   caller.chain([$PROGRAM_NAME]).chain(ARGV).any?(/tapioca/) &&
   ARGV.none?(/dsl/)
  return
end

# Gems.
require "connection_pool"

# Package files.
require_relative "stagehand/version"
require_relative "stagehand/internal/util"
require_relative "stagehand/internal/type/converter"
require_relative "stagehand/internal/type/unknown"
require_relative "stagehand/internal/type/boolean"
require_relative "stagehand/internal/type/file_input"
require_relative "stagehand/internal/type/enum"
require_relative "stagehand/internal/type/union"
require_relative "stagehand/internal/type/array_of"
require_relative "stagehand/internal/type/hash_of"
require_relative "stagehand/internal/type/base_model"
require_relative "stagehand/internal/type/base_page"
require_relative "stagehand/internal/type/base_stream"
require_relative "stagehand/internal/type/request_parameters"
require_relative "stagehand/internal"
require_relative "stagehand/request_options"
require_relative "stagehand/file_part"
require_relative "stagehand/errors"
require_relative "stagehand/internal/transport/base_client"
require_relative "stagehand/internal/transport/pooled_net_requester"
require_relative "stagehand/client"
require_relative "stagehand/internal/stream"
require_relative "stagehand/models/action"
require_relative "stagehand/models/model_config"
require_relative "stagehand/models/session_act_params"
require_relative "stagehand/models/session_act_response"
require_relative "stagehand/models/session_end_params"
require_relative "stagehand/models/session_end_response"
require_relative "stagehand/models/session_execute_params"
require_relative "stagehand/models/session_execute_response"
require_relative "stagehand/models/session_extract_params"
require_relative "stagehand/models/session_extract_response"
require_relative "stagehand/models/session_navigate_params"
require_relative "stagehand/models/session_navigate_response"
require_relative "stagehand/models/session_observe_params"
require_relative "stagehand/models/session_observe_response"
require_relative "stagehand/models/session_replay_params"
require_relative "stagehand/models/session_replay_response"
require_relative "stagehand/models/session_start_params"
require_relative "stagehand/models/session_start_response"
require_relative "stagehand/models/stream_event"
require_relative "stagehand/models"
require_relative "stagehand/resources/sessions"
require_relative "stagehand/local"
