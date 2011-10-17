require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get last_changes" do
    get :last_changes
    assert_response :success
  end

  test "should get organizations" do
    get :organizations
    assert_response :success
  end

  test "should get admins" do
    get :admins
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
