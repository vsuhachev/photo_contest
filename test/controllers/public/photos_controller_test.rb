require "test_helper"

class Public::PhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contest = contests(:in_progress)
    @nomination = nominations(:in_progress)
    @photo = photos(:in_progress)
  end

  def test_should_get_index
    get public_contest_nomination_photos_url(@contest, @nomination)
    assert_response :success
  end

  def test_should_get_show
    get public_contest_nomination_photo_url(@contest, @nomination, @photo)
    assert_response :success
  end
end
