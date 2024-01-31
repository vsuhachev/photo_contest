require "test_helper"

class ContestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @contest = contests(:one)
  end

  def test_should_get_index
    get contests_url
    assert_response :success
  end

  def test_should_get_new
    get new_contest_url
    assert_response :success
  end

  def test_should_create_contest
    assert_difference("Contest.count") do
      post contests_url, params: {contest: {description: @contest.description, title: @contest.title}}
    end

    assert_redirected_to contest_url(Contest.last)
  end

  def test_should_show_contest
    get contest_url(@contest)
    assert_response :success
  end

  def test_should_get_edit
    get edit_contest_url(@contest)
    assert_response :success
  end

  def test_should_update_contest
    patch contest_url(@contest), params: {contest: {description: @contest.description, title: @contest.title}}
    assert_redirected_to contest_url(@contest)
  end

  def test_should_destroy_contest
    @contest = contests(:alone)

    assert_difference("Contest.count", -1) do
      delete contest_url(@contest)
    end

    assert_redirected_to contests_url
  end
end
