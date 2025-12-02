# frozen_string_literal: true

require "faraday"
require "json"

module Stagehand
  # Low-level HTTP client for making API requests
  class HTTPClient
    attr_reader :base_url

    def initialize(config)
      @config = config
      @base_url = config.base_url
      @connection = build_connection
    end

    def post(path, body = nil, headers: {}, stream: false, &block)
      request(:post, path, body, headers: headers, stream: stream, &block)
    end

    def get(path, params = nil, headers: {})
      request(:get, path, params, headers: headers)
    end

    def delete(path, headers: {})
      request(:delete, path, nil, headers: headers)
    end

    private

    def build_connection
      Faraday.new(url: @config.base_url) do |f|
        f.options.timeout = @config.timeout
        f.options.open_timeout = @config.open_timeout
        f.request :json
        f.response :raise_error
        f.adapter Faraday.default_adapter
      end
    end

    def request(method, path, body_or_params, headers: {}, stream: false, &block)
      default_headers = {
        "Content-Type" => "application/json",
        "Accept" => stream ? "text/event-stream" : "application/json"
      }
      default_headers["Authorization"] = "Bearer #{@config.api_key}" if @config.api_key

      response = if stream && block_given?
                   stream_request(method, path, body_or_params, default_headers.merge(headers), &block)
                 else
                   @connection.run_request(method, path, body_or_params&.to_json, default_headers.merge(headers))
                 end

      parse_response(response) unless stream && block_given?
    rescue Faraday::ConnectionFailed => e
      raise ConnectionError, "Failed to connect: #{e.message}"
    rescue Faraday::TimeoutError => e
      raise ConnectionError, "Request timed out: #{e.message}"
    rescue Faraday::ClientError => e
      handle_client_error(e)
    end

    def stream_request(method, path, body, headers, &block)
      buffer = +""

      @connection.run_request(method, path, body&.to_json, headers) do |req|
        req.options.on_data = proc do |chunk, _overall_received_bytes, _env|
          buffer << chunk
          process_sse_buffer(buffer, &block)
        end
      end
    end

    def process_sse_buffer(buffer, &block)
      while (line_end = buffer.index("\n"))
        line = buffer.slice!(0, line_end + 1).strip
        next if line.empty?

        if line.start_with?("data: ")
          data = line[6..]
          next if data == "[DONE]"

          begin
            event = JSON.parse(data, symbolize_names: true)
            block.call(event)
          rescue JSON::ParserError
            # Skip malformed JSON
          end
        end
      end
    end

    def parse_response(response)
      return nil if response.body.nil? || response.body.empty?

      JSON.parse(response.body, symbolize_names: true)
    rescue JSON::ParserError
      response.body
    end

    def handle_client_error(error)
      status = error.response&.dig(:status)
      body = begin
        JSON.parse(error.response&.dig(:body) || "{}", symbolize_names: true)
      rescue JSON::ParserError
        { message: error.message }
      end

      message = body[:message] || body[:error] || error.message

      case status
      when 401
        raise AuthenticationError.new(message, status: status, body: body)
      when 404
        raise NotFoundError.new(message, status: status, body: body)
      when 422
        raise ValidationError.new(message, status: status, body: body)
      when 429
        raise RateLimitError.new(message, status: status, body: body)
      else
        raise APIError.new(message, status: status, body: body)
      end
    end
  end
end
