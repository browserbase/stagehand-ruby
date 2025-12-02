# frozen_string_literal: true

require "webrick"
require "json"
require "securerandom"

module Stagehand
  module Test
    # Mock Stagehand API server for integration testing
    #
    # This server simulates the Stagehand API responses and tracks
    # all requests made to it for verification in tests.
    class MockStagehandServer
      attr_reader :port, :requests, :session_id

      def initialize(port: 0)
        @port = port
        @requests = []
        @session_id = SecureRandom.uuid
        @server = nil
        @thread = nil
      end

      def start
        @server = WEBrick::HTTPServer.new(
          Port: @port,
          Logger: WEBrick::Log.new("/dev/null"),
          AccessLog: []
        )

        # Get the actual port if we used 0
        @port = @server.config[:Port]

        setup_routes

        @thread = Thread.new { @server.start }

        # Wait for server to be ready
        sleep 0.1 until server_ready?

        self
      end

      def stop
        @server&.shutdown
        @thread&.join(5)
      end

      def url
        "http://localhost:#{@port}"
      end

      def clear_requests
        @requests.clear
      end

      def requests_for(endpoint)
        @requests.select { |r| r[:endpoint] == endpoint }
      end

      private

      def server_ready?
        require "socket"
        TCPSocket.new("localhost", @port).close
        true
      rescue Errno::ECONNREFUSED
        false
      end

      def setup_routes
        @server.mount_proc "/sessions/start" do |req, res|
          handle_start(req, res)
        end

        @server.mount_proc "/" do |req, res|
          route_request(req, res)
        end
      end

      def route_request(req, res)
        path = req.path

        case path
        when %r{/sessions/([^/]+)/navigate$}
          handle_navigate(req, res, ::Regexp.last_match(1))
        when %r{/sessions/([^/]+)/act$}
          handle_act(req, res, ::Regexp.last_match(1))
        when %r{/sessions/([^/]+)/extract$}
          handle_extract(req, res, ::Regexp.last_match(1))
        when %r{/sessions/([^/]+)/observe$}
          handle_observe(req, res, ::Regexp.last_match(1))
        when %r{/sessions/([^/]+)/agentExecute$}
          handle_agent_execute(req, res, ::Regexp.last_match(1))
        when %r{/sessions/([^/]+)/end$}
          handle_end(req, res, ::Regexp.last_match(1))
        else
          res.status = 404
          res.body = { error: "Not found" }.to_json
        end
      end

      def record_request(req, endpoint)
        body = req.body ? JSON.parse(req.body, symbolize_names: true) : {}
        @requests << {
          path: req.path,
          endpoint: endpoint,
          method: req.request_method,
          body: body,
          timestamp: Time.now
        }
        body
      rescue JSON::ParserError
        @requests << {
          path: req.path,
          endpoint: endpoint,
          method: req.request_method,
          body: req.body,
          timestamp: Time.now
        }
        {}
      end

      def json_response(res, data, status: 200)
        res.status = status
        res.content_type = "application/json"
        res.body = data.to_json
      end

      def handle_start(req, res)
        body = record_request(req, "start")

        json_response(res, {
          sessionId: @session_id,
          available: true
        })
      end

      def handle_navigate(req, res, session_id)
        body = record_request(req, "navigate")

        json_response(res, {
          ok: true,
          status: 200,
          url: body[:url]
        })
      end

      def handle_act(req, res, session_id)
        body = record_request(req, "act")

        # Simulate different actions based on input
        input = body[:input]
        actions = []

        if input.is_a?(String)
          actions << {
            method: "click",
            selector: "a[href]",
            arguments: [],
            description: "Click on link matching: #{input}"
          }
        elsif input.is_a?(Hash)
          actions << input
        end

        json_response(res, {
          success: true,
          message: "Action completed: #{input}",
          actions: actions
        })
      end

      def handle_extract(req, res, session_id)
        body = record_request(req, "extract")

        instruction = body[:instruction] || "extract data"
        frame_id = body[:frameId]

        # Return mock extraction data
        extraction_data = {
          instruction: instruction,
          frame_id: frame_id,
          extracted_at: Time.now.iso8601,
          content: "Mock extracted content for: #{instruction}"
        }

        # If schema was provided, return structured data
        if body.dig(:options, :schema)
          json_response(res, extraction_data)
        else
          json_response(res, { extraction: extraction_data.to_json })
        end
      end

      def handle_observe(req, res, session_id)
        body = record_request(req, "observe")

        # Return mock observed actions (always return all - real API does smart filtering)
        actions = [
          {
            method: "click",
            selector: "h1",
            arguments: [],
            description: "Click on main heading",
            backendNodeId: 1
          },
          {
            method: "click",
            selector: "a[href]",
            arguments: [],
            description: "Click on link element",
            backendNodeId: 2
          },
          {
            method: "click",
            selector: "button.primary",
            arguments: [],
            description: "Click on primary button",
            backendNodeId: 3
          },
          {
            method: "fill",
            selector: "input[type='text']",
            arguments: [""],
            description: "Fill text input field",
            backendNodeId: 4
          }
        ]

        json_response(res, actions)
      end

      def handle_agent_execute(req, res, session_id)
        body = record_request(req, "agentExecute")

        execute_options = body[:executeOptions] || {}
        instruction = execute_options[:instruction] || "execute task"

        steps = [
          { action: "navigate", details: "Navigated to page" },
          { action: "observe", details: "Found interactive elements" },
          { action: "click", details: "Clicked target element" },
          { action: "verify", details: "Verified outcome" }
        ]

        json_response(res, {
          message: "Agent completed: #{instruction}",
          steps: steps
        })
      end

      def handle_end(req, res, session_id)
        record_request(req, "end")

        json_response(res, { success: true })
      end
    end
  end
end
