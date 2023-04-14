require "test_helper"

class LogoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get logouts_index_url
    assert_response :success
  end
end
