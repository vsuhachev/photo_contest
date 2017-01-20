require 'test_helper'

class Public::ContestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
  end

  test "should get index" do
    get public_contests_url
    assert_response :success
  end

  test "should get about" do
    get public_contest_about_url(@contest)
    assert_response :success
  end

  test "should get jurors" do
    get public_contest_jurors_url(@contest)
    assert_response :success
  end

  test "should get competitors" do
    get public_contest_competitors_url(@contest)
    assert_response :success
  end
end
