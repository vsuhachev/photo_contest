require 'test_helper'

class ContestPhotoTest < ActiveSupport::TestCase
  setup do
    @contest = contests(:two)
    @nomination = nominations(:two)
    @photo = photos(:two_alone)
  end

  test 'check validations' do
    p = ContestPhoto.new(photo: @photo, contest: @contest, nomination: @nomination)
    p.valid?
    assert_empty p.errors.messages
  end
end
