# frozen_string_literal: true

require_relative "../test_helper"

class StagehandSDK::Test::Resources::SessionsTest < StagehandSDK::Test::ResourceTest
  def test_act_required_params
    skip("Prism tests are disabled")

    response =
      @stagehand.sessions.act("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123", input: "Click the login button")

    assert_pattern do
      response => StagehandSDK::Models::SessionActResponse
    end

    assert_pattern do
      response => {
        data: StagehandSDK::Models::SessionActResponse::Data,
        success: StagehandSDK::Internal::Type::Boolean
      }
    end
  end

  def test_end_
    skip("Prism tests are disabled")

    response = @stagehand.sessions.end_("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123")

    assert_pattern do
      response => StagehandSDK::Models::SessionEndResponse
    end

    assert_pattern do
      response => {
        success: StagehandSDK::Internal::Type::Boolean
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
      response => StagehandSDK::Models::SessionExecuteResponse
    end

    assert_pattern do
      response => {
        data: StagehandSDK::Models::SessionExecuteResponse::Data,
        success: StagehandSDK::Internal::Type::Boolean
      }
    end
  end

  def test_extract
    skip("Prism tests are disabled")

    response = @stagehand.sessions.extract("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123")

    assert_pattern do
      response => StagehandSDK::Models::SessionExtractResponse
    end

    assert_pattern do
      response => {
        data: StagehandSDK::Models::SessionExtractResponse::Data,
        success: StagehandSDK::Internal::Type::Boolean
      }
    end
  end

  def test_navigate_required_params
    skip("Prism tests are disabled")

    response =
      @stagehand.sessions.navigate("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123", url: "https://example.com")

    assert_pattern do
      response => StagehandSDK::Models::SessionNavigateResponse
    end

    assert_pattern do
      response => {
        data: StagehandSDK::Models::SessionNavigateResponse::Data,
        success: StagehandSDK::Internal::Type::Boolean
      }
    end
  end

  def test_observe
    skip("Prism tests are disabled")

    response = @stagehand.sessions.observe("c4dbf3a9-9a58-4b22-8a1c-9f20f9f9e123")

    assert_pattern do
      response => StagehandSDK::Models::SessionObserveResponse
    end

    assert_pattern do
      response => {
        data: StagehandSDK::Models::SessionObserveResponse::Data,
        success: StagehandSDK::Internal::Type::Boolean
      }
    end
  end

  def test_start_required_params
    skip("Prism tests are disabled")

    response = @stagehand.sessions.start(model_name: "openai/gpt-4o")

    assert_pattern do
      response => StagehandSDK::Models::SessionStartResponse
    end

    assert_pattern do
      response => {
        data: StagehandSDK::Models::SessionStartResponse::Data,
        success: StagehandSDK::Internal::Type::Boolean
      }
    end
  end
end
