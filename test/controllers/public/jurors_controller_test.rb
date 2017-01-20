require 'test_helper'

class Public::JurorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
    @juror = jurors(:in_progress)
  end

  test "should get index" do
    get public_contest_jurors_url(@contest)
    assert_response :success
  end

  test "should get show" do
    get public_contest_juror_url(@contest, @juror)
    assert_response :success
  end
end
