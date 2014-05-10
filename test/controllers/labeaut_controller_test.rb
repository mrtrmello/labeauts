require 'test_helper'

class LabeautControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
