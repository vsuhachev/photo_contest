require 'test_helper'

class NominationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @contest = contests(:one)
    @nomination = nominations(:one)
  end

  test "should get index" do
    get contest_nominations_url(@contest)
    assert_response :success
  end

  test "should get new" do
    get new_contest_nomination_url(@contest)
    assert_response :success
  end

  test "should create nomination" do
    assert_difference('Nomination.count') do
      post contest_nominations_url(@contest), params: { nomination: { description: @nomination.description, title: @nomination.title } }
    end

    assert_redirected_to nomination_url(Nomination.last)
  end

  test "should show nomination" do
    get nomination_url(@nomination)
    assert_response :success
  end

  test "should get edit" do
    get edit_nomination_url(@nomination)
    assert_response :success
  end

  test "should update nomination" do
    patch nomination_url(@nomination), params: { nomination: { description: @nomination.description, title: @nomination.title } }
    assert_redirected_to nomination_url(@nomination)
  end

  test "should destroy nomination" do
    assert_difference('Nomination.count', -1) do
      delete nomination_url(@nomination)
    end

    assert_redirected_to contest_nominations_url(@contest)
  end
end
