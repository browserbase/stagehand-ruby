# frozen_string_literal: true

require_relative "../test_helper"

class Stagehand::Test::Resources::SessionsTest < Stagehand::Test::ResourceTest
  def test_act_required_params
    skip("Prism tests are disabled")

    response =
      @stagehand.sessions.act("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123", input: "Click the login button")

    assert_pattern do
      response => Stagehand::Models::SessionActResponse
    end

    assert_pattern do
      response => {
        data: Stagehand::Models::SessionActResponse::Data,
        success: Stagehand::Internal::Type::Boolean
      }
    end
  end

  def test_end_
    skip("Prism tests are disabled")

    response = @stagehand.sessions.end_("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123")

    assert_pattern do
      response => Stagehand::Models::SessionEndResponse
    end

    assert_pattern do
      response => {
        success: true | false
      }
    end
  end

  def test_execute_required_params
    skip("Prism tests are disabled")

    response =
      @stagehand.sessions.execute(
        "c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123",
        agent_config: {},
        execute_options: {instruction: "Log in with username 'demo' and password 'test123', then navigate to settings"}
      )

    assert_pattern do
      response => Stagehand::Models::SessionExecuteResponse
    end

    assert_pattern do
      response => {
        data: Stagehand::Models::SessionExecuteResponse::Data,
        success: Stagehand::Internal::Type::Boolean
      }
    end
  end

  def test_extract
    skip("Prism tests are disabled")

    response = @stagehand.sessions.extract("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123")

    assert_pattern do
      response => Stagehand::Models::SessionExtractResponse
    end

    assert_pattern do
      response => {
        data: Stagehand::Models::SessionExtractResponse::Data,
        success: Stagehand::Internal::Type::Boolean
      }
    end
  end

  def test_navigate_required_params
    skip("Prism tests are disabled")

    response =
      @stagehand.sessions.navigate("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123", url: "https://example.com")

    assert_pattern do
      response => Stagehand::Models::SessionNavigateResponse
    end

    assert_pattern do
      response => {
        data: Stagehand::Models::SessionNavigateResponse::Data,
        success: Stagehand::Internal::Type::Boolean
      }
    end
  end

  def test_observe
    skip("Prism tests are disabled")

    response = @stagehand.sessions.observe("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123")

    assert_pattern do
      response => Stagehand::Models::SessionObserveResponse
    end

    assert_pattern do
      response => {
        data: Stagehand::Models::SessionObserveResponse::Data,
        success: Stagehand::Internal::Type::Boolean
      }
    end
  end

  def test_start_required_params
    skip("Prism tests are disabled")

    response = @stagehand.sessions.start(model_name: "gpt-4o")

    assert_pattern do
      response => Stagehand::Models::SessionStartResponse
    end

    assert_pattern do
      response => {
        data: Stagehand::Models::SessionStartResponse::Data,
        success: Stagehand::Internal::Type::Boolean
      }
    end
  end
end
