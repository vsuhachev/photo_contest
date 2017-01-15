require 'test_helper'

class CompositionTest < ActiveSupport::TestCase
  setup do
    @contest = contests(:two)
    @nomination = nominations(:two)
    @competitor = competitors(:two)
    @photo = photos(:two_alone)
  end

  test 'check validations' do
    p = Composition.new(competitor: @competitor, photo: @photo, contest: @contest, nomination: @nomination)
    p.valid?
    assert_empty p.errors.messages
  end
end
