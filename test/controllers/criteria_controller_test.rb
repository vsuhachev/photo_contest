require 'test_helper'

class CriteriaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:one)
    @criterion = criteria(:one)
  end

  test "should get index" do
    get contest_criteria_url(@contest)
    assert_response :success
  end

  test "should get new" do
    get new_contest_criterion_url(@contest)
    assert_response :success
  end

  test "should create criterion" do
    assert_difference('Criterion.count') do
      post contest_criteria_url(@contest), params: { criterion: { description: @criterion.description, title: @criterion.title } }
    end

    assert_redirected_to criterion_url(Criterion.last)
  end

  test "should show criterion" do
    get criterion_url(@criterion)
    assert_response :success
  end

  test "should get edit" do
    get edit_criterion_url(@criterion)
    assert_response :success
  end

  test "should update criterion" do
    patch criterion_url(@criterion), params: { criterion: { description: @criterion.description, title: @criterion.title } }
    assert_redirected_to criterion_url(@criterion)
  end

  test "should destroy criterion" do
    assert_difference('Criterion.count', -1) do
      delete criterion_url(@criterion)
    end

    assert_redirected_to contest_criteria_url(@contest)
  end
end
