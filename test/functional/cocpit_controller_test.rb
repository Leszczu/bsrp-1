require 'test_helper'

class CocpitControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get biography" do
    get :biography
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get skins" do
    get :skins
    assert_response :success
  end

  test "should get change_password" do
    get :change_password
    assert_response :success
  end

  test "should get avatar" do
    get :avatar
    assert_response :success
  end

  test "should get gallery" do
    get :gallery
    assert_response :success
  end

  test "should get vehicles" do
    get :vehicles
    assert_response :success
  end

  test "should get logs" do
    get :logs
    assert_response :success
  end

  test "should get online" do
    get :online
    assert_response :success
  end

  test "should get find_player" do
    get :find_player
    assert_response :success
  end

end
