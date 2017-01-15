require 'test_helper'

class ContestPhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    sign_in @user
    @contest_photo = contest_photos(:two)

    @contest = contests(:two)
    @nomination = nominations(:two)
    @photo = photos(:two_alone)
  end

  test "should get index" do
    get contest_photos_url(@contest)
    assert_response :success
  end

  test "should get new" do
    get new_contest_photo_url(@contest, @contest_photo)
    assert_response :success
  end

  test "should create contest_photo" do
    assert_difference('ContestPhoto.count') do
      post contest_photos_url(@contest), params: { contest_photo: {
          nomination_id: @nomination.id,
          photo_id: @photo.id
      } }
    end

    assert_redirected_to contest_photo_url(@contest, ContestPhoto.last)
  end

  test "should show contest_photo" do
    get contest_photo_url(@contest, @contest_photo)
    assert_response :success
  end

  test "should get edit" do
    get edit_contest_photo_url(@contest, @contest_photo)
    assert_response :success
  end

  test "should update contest_photo" do
    patch contest_photo_url(@contest, @contest_photo), params: { contest_photo: {
        nomination_id: @contest_photo.nomination_id,
        photo_id: @contest_photo.photo_id
    } }
    assert_redirected_to contest_photo_url(@contest_photo)
  end

  test "should destroy contest_photo" do
    assert_difference('ContestPhoto.count', -1) do
      delete contest_photo_url(@contest, @contest_photo)
    end

    assert_redirected_to contest_photos_url(@contest)
  end
end
