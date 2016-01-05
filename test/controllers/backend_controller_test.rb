require 'test_helper'

class BackendControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get add_user" do
    get :add_user
    assert_response :success
  end

  test "should get edit_user" do
    get :edit_user
    assert_response :success
  end

  test "should get delete_user" do
    get :delete_user
    assert_response :success
  end

end
