require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    sign_in @user
    @contest = contests(:two)
    @photo = photos(:two)
    @competitor = competitors(:two)
    @nomination = nominations(:two)
  end

  test "should get index" do
    get contest_photos_url(@contest)
    assert_response :success
  end

  test "should get new" do
    get new_contest_photo_url(@contest)
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post contest_photos_url(@contest), params: { photo: {
          description: @photo.description,
          location: @photo.location,
          obtained_at: @photo.obtained_at,
          title: @photo.title,
          image: fixture_file_upload('files/test.jpg', 'image/jpeg'),
          competitor_id: @competitor.id,
          nomination_id: @nomination.id
      } }
    end

    assert_redirected_to photo_url(Photo.last)
  end

  test "should show photo" do
    get photo_url(@photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_photo_url(@photo)
    assert_response :success
  end

  test "should update photo" do
    patch photo_url(@photo), params: { photo: {
        description: @photo.description,
        location: @photo.location,
        obtained_at: @photo.obtained_at,
        title: @photo.title,
        image: fixture_file_upload('files/test.jpg', 'image/jpeg'),
        competitor_id: @competitor.id,
        nomination_id: @nomination.id
    } }
    assert_redirected_to photo_url(@photo)
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete photo_url(@photo)
    end

    assert_redirected_to contest_photos_url(@contest)
  end
end
