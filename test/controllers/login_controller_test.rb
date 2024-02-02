require "test_helper"

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get login_page" do
    get login_login_page_url
    assert_response :success
  end
end
