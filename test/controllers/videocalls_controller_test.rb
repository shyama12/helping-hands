require "test_helper"

class VideocallsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get videocalls_home_url
    assert_response :success
  end

  test "should get show" do
    get videocalls_show_url
    assert_response :success
  end
end
