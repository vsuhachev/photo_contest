require 'test_helper'

class Public::PhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
    @nomination = nominations(:in_progress)
    @photo = photos(:in_progress)
  end

  test "should get index" do
    get public_contest_nomination_photos_url(@contest, @nomination)
    assert_response :success
  end

  test "should get show" do
    get public_contest_nomination_photo_url(@contest, @nomination, @photo)
    assert_response :success
  end
end
