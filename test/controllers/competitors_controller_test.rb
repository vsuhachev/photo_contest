require 'test_helper'

class CompetitorsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @competitor = competitors(:one)
  end

  test "should get index" do
    get competitors_url
    assert_response :success
  end

  test "should get new" do
    get new_competitor_url
    assert_response :success
  end

  test "should create competitor" do
    assert_difference('Competitor.count') do
      post competitors_url, params: { competitor: { dob: @competitor.dob, fio1: @competitor.fio1, fio2: @competitor.fio2, fio3: @competitor.fio3 } }
    end
    assert_redirected_to competitor_url(Competitor.last)
    assert_equal @user, Competitor.last.user
  end

  test "should show competitor" do
    get competitor_url(@competitor)
    assert_response :success
  end

  test "should get edit" do
    get edit_competitor_url(@competitor)
    assert_response :success
  end

  test "should update competitor" do
    patch competitor_url(@competitor), params: { competitor: { dob: @competitor.dob, fio1: @competitor.fio1, fio2: @competitor.fio2, fio3: @competitor.fio3 } }
    assert_redirected_to competitor_url(@competitor)
  end

  test "should destroy competitor" do
    assert_difference('Competitor.count', -1) do
      delete competitor_url(@competitor)
    end

    assert_redirected_to competitors_url
  end
end
