require "test_helper"

class PhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    sign_in @user
    @contest = contests(:two)
    @photo = photos(:two)
    @competitor = competitors(:two)
    @nomination = nominations(:two)
  end

  def test_should_get_index
    get contest_photos_url(@contest)
    assert_response :success
  end

  def test_should_get_new
    get new_contest_photo_url(@contest)
    assert_response :success
  end

  def test_should_create_photo
    assert_difference("Photo.count") do
      post contest_photos_url(@contest), params: {photo: {
        description: @photo.description,
        location: @photo.location,
        obtained_at: @photo.obtained_at,
        title: @photo.title,
        image: fixture_file_upload("test.jpg", "image/jpeg"),
        competitor_id: @competitor.id,
        nomination_id: @nomination.id
      }}
    end

    assert_redirected_to photo_url(Photo.last)
  end

  def test_should_show_photo
    get photo_url(@photo)
    assert_response :success
  end

  def test_should_get_edit
    get edit_photo_url(@photo)
    assert_response :success
  end

  def test_should_update_photo
    patch photo_url(@photo), params: {photo: {
      description: @photo.description,
      location: @photo.location,
      obtained_at: @photo.obtained_at,
      title: @photo.title,
      image: fixture_file_upload("test.jpg", "image/jpeg"),
      competitor_id: @competitor.id,
      nomination_id: @nomination.id
    }}
    assert_redirected_to photo_url(@photo)
  end

  def test_should_destroy_photo
    assert_difference("Photo.count", -1) do
      delete photo_url(@photo)
    end

    assert_redirected_to contest_photos_url(@contest)
  end
end
