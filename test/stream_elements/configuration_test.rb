require "test_helper"

class ConfigurationTest < Minitest::Test

  def setup
    StreamElements.config.token = "abc123"
    StreamElements.config.channel = "123abc"
  end

  def test_token
    assert_equal "abc123", StreamElements.config.token
  end

  def test_channel
    assert_equal "123abc", StreamElements.config.channel
  end

end
