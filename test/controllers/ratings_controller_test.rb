require 'test_helper'

class RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    sign_in @user

    @rating = ratings(:one)
    @new_criterion = criteria(:in_progress_alone)
  end

  test "should get index" do
    get ratings_url(format: :json)
    assert_response :success
  end

  test "should create rating" do
    assert_difference('Rating.count') do
      post ratings_url(format: :json) , params: { rating: {
          criterion_id: @new_criterion.id,
          photo_id: @rating.photo_id,
          value: @rating.value
      } }
    end

    assert_response :created
  end

  test "should show rating" do
    get rating_url(@rating, format: :json)
    assert_response :success
  end

  test "should update rating" do
    patch rating_url(@rating, format: :json), params: { rating: {
        value: 7
    } }

    assert_response :ok
  end

  test "should destroy rating" do
    assert_difference('Rating.count', -1) do
      delete rating_url(@rating, format: :json)
    end

    assert_response :no_content
  end
end
