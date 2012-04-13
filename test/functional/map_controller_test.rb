require 'test_helper'

class MapControllerTest < ActionController::TestCase
  test "should get show_position" do
    get :show_position
    assert_response :success
  end

end
