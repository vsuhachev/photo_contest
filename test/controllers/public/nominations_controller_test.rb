require 'test_helper'

class Public::NominationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
  end

  test "should get index" do
    get public_nominations_url(@contest)
    assert_response :success
  end
end
