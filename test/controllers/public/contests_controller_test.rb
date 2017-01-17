require 'test_helper'

class Public::ContestsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_contests_url
    assert_response :success
  end
end
