require "test_helper"

class Public::NominationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
  end

  def test_should_get_index
    get public_contest_nominations_url(@contest)
    assert_response :success
  end
end
