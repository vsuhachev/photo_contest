require "test_helper"

class Public::CompetitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
    @competitor = competitors(:in_progress)
  end

  def test_should_get_index
    get public_contest_competitors_url(@contest)
    assert_response :success
  end

  def test_should_get_show
    get public_contest_competitor_url(@contest, @competitor)
    assert_response :success
  end
end
