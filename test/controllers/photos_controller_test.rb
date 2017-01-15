require 'test_helper'

class PhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @photo = photos(:one)
  end

  test "should get index" do
    get photos_url
    assert_response :success
  end

  test "should get new" do
    get new_photo_url
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post photos_url, params: { photo: {
          description: @photo.description,
          location: @photo.location,
          obtained_at: @photo.obtained_at,
          title: @photo.title,
          image: fixture_file_upload('files/test.jpg', 'image/jpeg')
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
        image: fixture_file_upload('files/test.jpg', 'image/jpeg')
    } }
    assert_redirected_to photo_url(@photo)
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete photo_url(@photo)
    end

    assert_redirected_to photos_url
  end
end
