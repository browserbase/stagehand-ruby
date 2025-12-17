# frozen_string_literal: true

require_relative "../test_helper"

class Stagehand::Test::Resources::SessionsTest < Stagehand::Test::ResourceTest
  def test_start
    skip("Prism tests are disabled")

    response = @stagehand.sessions.start

    assert_pattern do
      response => Stagehand::Internal::Type::Unknown
    end
  end
end
