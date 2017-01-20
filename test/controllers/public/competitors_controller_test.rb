require 'test_helper'

class Public::CompetitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
    @competitor = competitors(:in_progress)
  end

  test "should get index" do
    get public_contest_competitors_url(@contest)
    assert_response :success
  end

  test "should get show" do
    get public_contest_competitor_url(@contest, @competitor)
    assert_response :success
  end
end
