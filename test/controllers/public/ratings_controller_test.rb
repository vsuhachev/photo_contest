require 'test_helper'

class Public::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @contest = contests(:in_progress)
    @nomination = nominations(:in_progress)
    @photo = photos(:in_progress)
  end

  test "should get index for contest" do
    get public_contest_ratings_url(@contest)
    assert_response :success
  end

  test "should get index for nomination" do
    get public_contest_nomination_ratings_url(@contest, @nomination)
    assert_response :success
  end

  test "should get show" do
    get public_contest_nomination_photo_ratings_url(@contest, @nomination, @photo)
    assert_response :success
  end

end
