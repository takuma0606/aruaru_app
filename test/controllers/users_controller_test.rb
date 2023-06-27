require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get user" do
    get users_user_url
    assert_response :success
  end

  test "should get my_posts" do
    get users_my_posts_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

end
