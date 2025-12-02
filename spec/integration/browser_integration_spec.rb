# frozen_string_literal: true

require "spec_helper"
require "securerandom"

# Check if Ferrum/Chrome is available
BROWSER_AVAILABLE = begin
  require "ferrum"
  # Try to find Chrome
  chrome_paths = %w[
    /usr/bin/chromium-browser
    /usr/bin/chromium
    /usr/bin/google-chrome
    /usr/bin/chrome
  ]
  chrome_found = chrome_paths.any? { |p| File.exist?(p) } || ENV["CHROME_PATH"]
  chrome_found
rescue LoadError
  false
end

RSpec.describe "Browser Integration", :integration do
  before(:all) do
    @mock_server = Stagehand::Test::MockStagehandServer.new.start
  end

  after(:all) do
    @mock_server&.stop
  end

  before(:each) do
    @mock_server.clear_requests

    @client = Stagehand::Client.new(
      base_url: @mock_server.url,
      api_key: "test-api-key"
    )
  end

  after(:each) do
    @client.session.end_ if @client&.session&.active?
  end

  describe "SDK workflow against mock API" do
    it "completes full workflow with frame_id parameter" do
      # Simulate frame_id that would come from Ferrum
      frame_id = "main-frame-#{SecureRandom.hex(8)}"
      target_id = "target-#{SecureRandom.hex(8)}"

      puts "Simulated frame_id: #{frame_id}"
      puts "Simulated target_id: #{target_id}"

      # Step 1: Start Stagehand session
      start_response = @client.session.start(env: :LOCAL)
      expect(start_response.session_id).not_to be_nil
      expect(@client.session.active?).to be true

      start_requests = @mock_server.requests_for("start")
      expect(start_requests.length).to eq(1)
      expect(start_requests.first[:body][:env]).to eq("LOCAL")

      # Step 2: Navigate
      nav_response = @client.session.navigate(url: "https://example.com")
      expect(nav_response.ok).to be true

      nav_requests = @mock_server.requests_for("navigate")
      expect(nav_requests.length).to eq(1)
      expect(nav_requests.first[:body][:url]).to eq("https://example.com")

      # Step 3: Extract data with frame_id
      extract_response = @client.session.extract(
        instruction: "Extract the main heading",
        frame_id: frame_id
      )
      expect(extract_response.extraction).not_to be_nil

      extract_requests = @mock_server.requests_for("extract")
      expect(extract_requests.length).to eq(1)
      expect(extract_requests.first[:body][:frameId]).to eq(frame_id)
      expect(extract_requests.first[:body][:instruction]).to eq("Extract the main heading")

      # Step 4: Observe page elements with frame_id
      observe_response = @client.session.observe(
        instruction: "find clickable elements",
        frame_id: frame_id
      )
      expect(observe_response.actions).not_to be_empty

      observe_requests = @mock_server.requests_for("observe")
      expect(observe_requests.length).to eq(1)
      expect(observe_requests.first[:body][:frameId]).to eq(frame_id)

      # Step 5: Act on the page with frame_id
      act_response = @client.session.act(
        input: "click the More information link",
        frame_id: frame_id
      )
      expect(act_response.success).to be true
      expect(act_response.actions).not_to be_empty

      act_requests = @mock_server.requests_for("act")
      expect(act_requests.length).to eq(1)
      expect(act_requests.first[:body][:frameId]).to eq(frame_id)
      expect(act_requests.first[:body][:input]).to eq("click the More information link")

      # Step 6: Execute agent with frame_id
      agent_response = @client.session.execute_agent(
        execute_options: {
          instruction: "Find and click the main link",
          max_steps: 5
        },
        agent_config: {
          model: "openai/gpt-4o"
        },
        frame_id: frame_id
      )
      expect(agent_response.message).not_to be_nil
      expect(agent_response.steps).not_to be_empty

      agent_requests = @mock_server.requests_for("agentExecute")
      expect(agent_requests.length).to eq(1)
      expect(agent_requests.first[:body][:frameId]).to eq(frame_id)

      # Step 7: End session
      end_response = @client.session.end_
      expect(end_response.success).to be true
      expect(@client.session.active?).to be false

      end_requests = @mock_server.requests_for("end")
      expect(end_requests.length).to eq(1)

      puts "\nAll requests made to mock server:"
      @mock_server.requests.each do |req|
        puts "  #{req[:method]} #{req[:path]}"
        puts "    body: #{req[:body].to_json[0..80]}..."
      end
    end
  end

  describe "extract with schema" do
    it "passes schema to the API and returns raw hash" do
      frame_id = "frame-#{SecureRandom.hex(4)}"

      @client.session.start(env: :LOCAL)

      schema = {
        type: "object",
        properties: {
          title: { type: "string" },
          links: { type: "array", items: { type: "string" } }
        }
      }

      response = @client.session.extract(
        instruction: "Extract page structure",
        frame_id: frame_id,
        options: { schema: schema }
      )

      # When schema is provided, returns raw hash
      expect(response).to be_a(Hash)

      extract_requests = @mock_server.requests_for("extract")
      expect(extract_requests.first[:body][:options][:schema]).to eq(schema)
    end
  end

  describe "observe with options" do
    it "passes selector and model options" do
      frame_id = "frame-#{SecureRandom.hex(4)}"

      @client.session.start(env: :LOCAL)

      response = @client.session.observe(
        instruction: "find buttons",
        frame_id: frame_id,
        options: {
          selector: "a, button",
          model: "openai/gpt-4o",
          timeout: 10_000
        }
      )

      expect(response.actions).to be_an(Array)

      observe_requests = @mock_server.requests_for("observe")
      body = observe_requests.first[:body]
      expect(body[:options][:selector]).to eq("a, button")
      expect(body[:options][:model]).to eq("openai/gpt-4o")
      expect(body[:options][:timeout]).to eq(10_000)
    end
  end

  describe "act with variables and timeout" do
    it "passes template variables and timeout to act" do
      frame_id = "frame-#{SecureRandom.hex(4)}"

      @client.session.start(env: :LOCAL)

      response = @client.session.act(
        input: "fill in the search box with {{query}}",
        frame_id: frame_id,
        options: {
          variables: { query: "test search" },
          timeout: 5000,
          model: "anthropic/claude-3"
        }
      )

      expect(response.success).to be true

      act_requests = @mock_server.requests_for("act")
      body = act_requests.first[:body]
      expect(body[:options][:variables]).to eq({ query: "test search" })
      expect(body[:options][:timeout]).to eq(5000)
      expect(body[:options][:model]).to eq("anthropic/claude-3")
    end
  end

  describe "execute_agent with full config" do
    it "passes all agent configuration options" do
      frame_id = "frame-#{SecureRandom.hex(4)}"

      @client.session.start(env: :LOCAL)

      response = @client.session.execute_agent(
        execute_options: {
          instruction: "Complete checkout process",
          max_steps: 20,
          highlight_cursor: true
        },
        agent_config: {
          model: {
            model: "gpt-4o",
            api_key: "custom-key",
            base_url: "https://custom.openai.com"
          },
          provider: :openai,
          system_prompt: "You are a helpful assistant",
          cua: true
        },
        frame_id: frame_id
      )

      expect(response.message).to include("Agent completed")
      expect(response.steps.length).to eq(4)

      agent_requests = @mock_server.requests_for("agentExecute")
      body = agent_requests.first[:body]

      expect(body[:executeOptions][:instruction]).to eq("Complete checkout process")
      expect(body[:executeOptions][:maxSteps]).to eq(20)
      expect(body[:executeOptions][:highlightCursor]).to be true
      expect(body[:agentConfig][:provider]).to eq("openai")
      expect(body[:agentConfig][:systemPrompt]).to eq("You are a helpful assistant")
      expect(body[:agentConfig][:cua]).to be true
    end
  end

  describe "session state management" do
    it "raises SessionError when calling methods before start" do
      expect {
        @client.session.navigate(url: "https://example.com")
      }.to raise_error(Stagehand::SessionError, /No active session/)

      expect {
        @client.session.act(input: "click")
      }.to raise_error(Stagehand::SessionError)

      expect {
        @client.session.extract(instruction: "extract")
      }.to raise_error(Stagehand::SessionError)

      expect {
        @client.session.observe
      }.to raise_error(Stagehand::SessionError)

      expect {
        @client.session.execute_agent(execute_options: { instruction: "do" })
      }.to raise_error(Stagehand::SessionError)

      expect {
        @client.session.end_
      }.to raise_error(Stagehand::SessionError)
    end

    it "tracks active state correctly" do
      expect(@client.session.active?).to be false
      expect(@client.session.session_id).to be_nil

      @client.session.start(env: :LOCAL)
      expect(@client.session.active?).to be true
      expect(@client.session.session_id).not_to be_nil

      stored_session_id = @client.session.session_id

      @client.session.end_
      expect(@client.session.active?).to be false
      expect(@client.session.session_id).to be_nil

      # Can start a new session
      @client.session.start(env: :BROWSERBASE, api_key: "bb-key", project_id: "proj-123")
      expect(@client.session.active?).to be true
      # Note: mock server returns same session_id, but in real API it would be different
    end
  end

  describe "navigate with options" do
    it "passes wait_until option" do
      @client.session.start(env: :LOCAL)

      @client.session.navigate(
        url: "https://example.com",
        options: { wait_until: :networkidle }
      )

      nav_requests = @mock_server.requests_for("navigate")
      expect(nav_requests.first[:body][:options][:waitUntil]).to eq("networkidle")
    end
  end

  describe "start with full options" do
    it "passes all start options to the API" do
      @client.session.start(
        env: :BROWSERBASE,
        api_key: "bb-api-key",
        project_id: "project-123",
        model: "openai/gpt-4o",
        system_prompt: "You are a web automation expert",
        self_heal: true,
        dom_settle_timeout: 3000,
        verbose: 2,
        browserbase_session_id: "existing-session",
        local_browser_launch_options: {
          headless: true,
          executable_path: "/usr/bin/chrome"
        }
      )

      start_requests = @mock_server.requests_for("start")
      body = start_requests.first[:body]

      expect(body[:env]).to eq("BROWSERBASE")
      expect(body[:apiKey]).to eq("bb-api-key")
      expect(body[:projectId]).to eq("project-123")
      expect(body[:model]).to eq("openai/gpt-4o")
      expect(body[:systemPrompt]).to eq("You are a web automation expert")
      expect(body[:selfHeal]).to be true
      expect(body[:domSettleTimeout]).to eq(3000)
      expect(body[:verbose]).to eq(2)
      expect(body[:browserbaseSessionId]).to eq("existing-session")
      expect(body[:localBrowserLaunchOptions][:headless]).to be true
      expect(body[:localBrowserLaunchOptions][:executablePath]).to eq("/usr/bin/chrome")
    end
  end

  describe "response types" do
    it "returns properly typed responses" do
      @client.session.start(env: :LOCAL)

      # SessionStartResponse
      expect(@client.session.session_id).to be_a(String)

      # SessionNavigateResponse
      nav = @client.session.navigate(url: "https://example.com")
      expect(nav).to be_a(Stagehand::Types::SessionNavigateResponse)
      expect(nav.ok).to be true
      expect(nav.url).to eq("https://example.com")

      # SessionActResponse
      act = @client.session.act(input: "click button")
      expect(act).to be_a(Stagehand::Types::SessionActResponse)
      expect(act.success).to be true
      expect(act.actions).to all(be_a(Stagehand::Types::Action))
      expect(act.actions.first.method).to eq("click")

      # SessionExtractResponse
      extract = @client.session.extract(instruction: "get heading")
      expect(extract).to be_a(Stagehand::Types::SessionExtractResponse)
      expect(extract.extraction).not_to be_nil

      # SessionObserveResponse
      observe = @client.session.observe
      expect(observe).to be_a(Stagehand::Types::SessionObserveResponse)
      expect(observe.actions).to all(be_a(Stagehand::Types::Action))

      # SessionExecuteAgentResponse
      agent = @client.session.execute_agent(
        execute_options: { instruction: "do task" }
      )
      expect(agent).to be_a(Stagehand::Types::SessionExecuteAgentResponse)
      expect(agent.message).to be_a(String)
      expect(agent.steps).to be_an(Array)

      # SessionEndResponse
      end_resp = @client.session.end_
      expect(end_resp).to be_a(Stagehand::Types::SessionEndResponse)
      expect(end_resp.success).to be true
    end
  end

  # Conditional Ferrum tests - only run if browser is available
  if BROWSER_AVAILABLE
    describe "with real browser (Ferrum)", :browser do
      before(:each) do
        @browser = Ferrum::Browser.new(
          headless: true,
          timeout: 30,
          browser_options: {
            "no-sandbox" => nil,
            "disable-gpu" => nil,
            "disable-dev-shm-usage" => nil
          }
        )
      end

      after(:each) do
        @browser&.quit
      end

      it "uses real frame_id from Ferrum" do
        @browser.go_to("https://example.com")
        expect(@browser.current_url).to include("example.com")

        main_frame = @browser.main_frame
        real_frame_id = main_frame.id

        @client.session.start(env: :LOCAL)

        # Use real frame_id from Ferrum
        @client.session.extract(
          instruction: "Extract heading",
          frame_id: real_frame_id
        )

        extract_requests = @mock_server.requests_for("extract")
        expect(extract_requests.first[:body][:frameId]).to eq(real_frame_id)

        # Verify page content with Ferrum
        heading = @browser.evaluate("document.querySelector('h1')?.textContent")
        expect(heading).to include("Example")
      end

      it "can target multiple frames" do
        # Create a page with iframe
        @browser.go_to("data:text/html,<html><body><h1>Main</h1><iframe src='https://example.com'></iframe></body></html>")
        sleep 1

        main_frame_id = @browser.main_frame.id
        frames = @browser.frames

        @client.session.start(env: :LOCAL)

        # Extract from main frame
        @client.session.extract(
          instruction: "Extract main content",
          frame_id: main_frame_id
        )

        if frames.length > 1
          iframe = frames.find { |f| f.id != main_frame_id }
          if iframe
            @client.session.extract(
              instruction: "Extract iframe content",
              frame_id: iframe.id
            )

            extract_requests = @mock_server.requests_for("extract")
            frame_ids = extract_requests.map { |r| r[:body][:frameId] }
            expect(frame_ids).to include(main_frame_id)
            expect(frame_ids).to include(iframe.id)
          end
        end
      end
    end
  else
    describe "with real browser (Ferrum)", :browser do
      it "skipped - Chrome/Chromium not available" do
        skip "Chrome/Chromium not installed. Set CHROME_PATH or install Chrome to run browser tests."
      end
    end
  end
end
