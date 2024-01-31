require "test_helper"

class NominationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @contest = contests(:one)
    @nomination = nominations(:one)
  end

  def test_should_get_index
    get contest_nominations_url(@contest)
    assert_response :success
  end

  def test_should_get_new
    get new_contest_nomination_url(@contest)
    assert_response :success
  end

  def test_should_create_nomination
    assert_difference("Nomination.count") do
      post contest_nominations_url(@contest), params: {nomination: {description: @nomination.description, title: @nomination.title}}
    end

    assert_redirected_to nomination_url(Nomination.last)
  end

  def test_should_show_nomination
    get nomination_url(@nomination)
    assert_response :success
  end

  def test_should_get_edit
    get edit_nomination_url(@nomination)
    assert_response :success
  end

  def test_should_update_nomination
    patch nomination_url(@nomination), params: {nomination: {description: @nomination.description, title: @nomination.title}}
    assert_redirected_to nomination_url(@nomination)
  end

  def test_should_destroy_nomination
    @contest = contests(:alone)
    @nomination = nominations(:alone)

    assert_difference("Nomination.count", -1) do
      delete nomination_url(@nomination)
    end

    assert_redirected_to contest_nominations_url(@contest)
  end
end
