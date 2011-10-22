require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "should get _comment" do
    get :_comment
    assert_response :success
  end

end
