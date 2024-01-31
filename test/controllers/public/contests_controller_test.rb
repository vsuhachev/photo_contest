require "test_helper"

class Public::ContestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
  end

  def test_should_get_index
    get public_contests_url
    assert_response :success
  end

  def test_should_get_about
    get public_contest_about_url(@contest)
    assert_response :success
  end
end
