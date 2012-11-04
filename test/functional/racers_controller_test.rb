require 'test_helper'

class RacersControllerTest < ActionController::TestCase
  test "should get race" do
    get :race
    assert_response :success
  end

end
