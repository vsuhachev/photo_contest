require "test_helper"

class RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    sign_in @user

    @rating = ratings(:one)
    @new_criterion = criteria(:in_progress_alone)
  end

  def test_should_get_index
    get ratings_url(format: :json)
    assert_response :success
  end

  def test_should_create_rating
    assert_difference("Rating.count") do
      post ratings_url(format: :json), params: {rating: {
        criterion_id: @new_criterion.id,
        photo_id: @rating.photo_id,
        value: @rating.value
      }}
    end

    assert_response :created
  end

  def test_should_show_rating
    get rating_url(@rating, format: :json)
    assert_response :success
  end

  def test_should_update_rating
    patch rating_url(@rating, format: :json), params: {rating: {
      value: 7
    }}

    assert_response :ok
  end

  def test_should_destroy_rating
    assert_difference("Rating.count", -1) do
      delete rating_url(@rating, format: :json)
    end

    assert_response :no_content
  end
end
