require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get calendar" do
    get user_calendar_url
    assert_response :success
  end
end
