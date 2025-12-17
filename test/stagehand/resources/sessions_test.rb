# frozen_string_literal: true

require_relative "../test_helper"

class Stagehand::Test::Resources::SessionsTest < Stagehand::Test::ResourceTest
  def test_act
    skip("Prism tests are disabled")

    response = @stagehand.sessions.act({})

    assert_pattern do
      response => Stagehand::Internal::Type::Unknown
    end
  end

  def test_end_
    skip("Prism tests are disabled")

    response = @stagehand.sessions.end_({})

    assert_pattern do
      response => Stagehand::Internal::Type::Unknown
    end
  end

  def test_execute_agent
    skip("Prism tests are disabled")

    response = @stagehand.sessions.execute_agent({})

    assert_pattern do
      response => Stagehand::Internal::Type::Unknown
    end
  end

  def test_extract
    skip("Prism tests are disabled")

    response = @stagehand.sessions.extract({})

    assert_pattern do
      response => Stagehand::Internal::Type::Unknown
    end
  end

  def test_navigate
    skip("Prism tests are disabled")

    response = @stagehand.sessions.navigate({})

    assert_pattern do
      response => Stagehand::Internal::Type::Unknown
    end
  end

  def test_observe
    skip("Prism tests are disabled")

    response = @stagehand.sessions.observe({})

    assert_pattern do
      response => Stagehand::Internal::Type::Unknown
    end
  end

  def test_start
    skip("Prism tests are disabled")

    response = @stagehand.sessions.start

    assert_pattern do
      response => Stagehand::Internal::Type::Unknown
    end
  end
end
