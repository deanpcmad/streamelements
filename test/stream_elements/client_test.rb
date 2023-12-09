require "test_helper"

class ClientTest < Minitest::Test
  def test_jwt_access_token
    client = StreamElements::Client.new jwt_access_token: "abc123"
    assert_equal "abc123", client.jwt_access_token
  end

  def test_access_token
    client = StreamElements::Client.new access_token: "123abc"
    assert_equal "123abc", client.access_token
  end

  def test_no_token
    client = StreamElements::Client.new jwt_access_token: nil, access_token: nil
    assert_raises(StreamElements::Error) { client.connection }
  end
end
