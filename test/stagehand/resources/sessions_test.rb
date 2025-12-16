# frozen_string_literal: true

require_relative "../test_helper"

class Stagehand::Test::Resources::SessionsTest < Stagehand::Test::ResourceTest
  def test_act_required_params
    skip("Prism tests are disabled")

    response =
      @stagehand.sessions.act("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", input: "click the sign in button")

    assert_pattern do
      response => Stagehand::Models::SessionActResponse
    end

    assert_pattern do
      response => {
        actions: ^(Stagehand::Internal::Type::ArrayOf[Stagehand::Action]),
        message: String,
        success: Stagehand::Internal::Type::Boolean
      }
    end
  end

  def test_end_
    skip("Prism tests are disabled")

    response = @stagehand.sessions.end_("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Stagehand::Models::SessionEndResponse
    end

    assert_pattern do
      response => {
        success: Stagehand::Internal::Type::Boolean | nil
      }
    end
  end

  def test_execute_agent_required_params
    skip("Prism tests are disabled")

    response =
      @stagehand.sessions.execute_agent(
        "182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e",
        agent_config: {},
        execute_options: {instruction: "Find and click the first product"}
      )

    assert_pattern do
      response => Stagehand::Models::SessionExecuteAgentResponse
    end

    assert_pattern do
      response => {
        message: String | nil
      }
    end
  end

  def test_extract
    skip("Prism tests are disabled")

    response = @stagehand.sessions.extract("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => Stagehand::Models::SessionExtractResponse
    end

    assert_pattern do
      case response
      in Stagehand::Models::SessionExtractResponse::Extraction
      in Stagehand::Models::SessionExtractResponse::CustomMap
      end
    end
  end

  def test_navigate_required_params
    skip("Prism tests are disabled")

    response =
      @stagehand.sessions.navigate("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e", url: "https://example.com")

    assert_pattern do
      response => Stagehand::Models::SessionNavigateResponse
    end

    assert_pattern do
      response => {
        ok: Stagehand::Internal::Type::Boolean | nil,
        status: Integer | nil,
        url: String | nil
      }
    end
  end

  def test_observe
    skip("Prism tests are disabled")

    response = @stagehand.sessions.observe("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => ^(Stagehand::Internal::Type::ArrayOf[Stagehand::Action])
    end
  end

  def test_start_required_params
    skip("Prism tests are disabled")

    response =
      @stagehand.sessions.start(
        browserbase_api_key: "BROWSERBASE_API_KEY",
        browserbase_project_id: "BROWSERBASE_PROJECT_ID"
      )

    assert_pattern do
      response => Stagehand::Models::SessionStartResponse
    end

    assert_pattern do
      response => {
        available: Stagehand::Internal::Type::Boolean,
        session_id: String
      }
    end
  end
end
