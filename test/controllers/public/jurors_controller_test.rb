require 'test_helper'

class Public::JurorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
    @juror = jurors(:in_progress)
  end

  def test_should_get_index
    get public_contest_jurors_url(@contest)
    assert_response :success
  end

  def test_should_get_show
    get public_contest_juror_url(@contest, @juror)
    assert_response :success
  end
end
