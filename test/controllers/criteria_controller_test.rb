require "test_helper"

class CriteriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @contest = contests(:one)
    @criterion = criteria(:one)
  end

  def test_should_get_index
    get contest_criteria_url(@contest)
    assert_response :success
  end

  def test_should_get_new
    get new_contest_criterion_url(@contest)
    assert_response :success
  end

  def test_should_create_criterion
    assert_difference("Criterion.count") do
      post contest_criteria_url(@contest), params: {criterion: {description: @criterion.description, title: @criterion.title}}
    end

    assert_redirected_to criterion_url(Criterion.last)
  end

  def test_should_show_criterion
    get criterion_url(@criterion)
    assert_response :success
  end

  def test_should_get_edit
    get edit_criterion_url(@criterion)
    assert_response :success
  end

  def test_should_update_criterion
    patch criterion_url(@criterion), params: {criterion: {description: @criterion.description, title: @criterion.title}}
    assert_redirected_to criterion_url(@criterion)
  end

  def test_should_destroy_criterion
    assert_difference("Criterion.count", -1) do
      delete criterion_url(@criterion)
    end

    assert_redirected_to contest_criteria_url(@contest)
  end
end
