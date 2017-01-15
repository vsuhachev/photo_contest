require 'test_helper'

class CompositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    sign_in @user
    @composition = compositions(:two)

    @contest = contests(:two)
    @nomination = nominations(:two)
    @photo = photos(:two_alone)
    @competitor = competitors(:two)
  end

  test "should get index" do
    get contest_compositions_url(@contest)
    assert_response :success
  end

  test "should get new" do
    get new_contest_composition_url(@contest)
    assert_response :success
  end

  test "should create composition" do
    assert_difference('Composition.count') do
      post contest_compositions_url(@contest), params: { composition: {
          nomination_id: @nomination.id,
          photo_id: @photo.id,
          competitor_id: @competitor.id
      } }
    end

    assert_redirected_to composition_url(Composition.last)
  end

  test "should show composition" do
    get composition_url(@composition)
    assert_response :success
  end

  test "should get edit" do
    get edit_composition_url(@composition)
    assert_response :success
  end

  test "should update composition" do
    patch composition_url(@composition), params: { composition: {
        nomination_id: @composition.nomination_id,
        photo_id: @composition.photo_id,
        competitor_id: @competitor.id
    } }
    assert_redirected_to composition_url(@composition)
  end

  test "should destroy composition" do
    assert_difference('Composition.count', -1) do
      delete composition_url(@composition)
    end

    assert_redirected_to contest_compositions_url(@contest)
  end
end
