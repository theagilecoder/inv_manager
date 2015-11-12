require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get spage1" do
    get :spage1
    assert_response :success
  end

  test "should get spage2" do
    get :spage2
    assert_response :success
  end

end
