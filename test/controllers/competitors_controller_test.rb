require 'test_helper'

class CompetitorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:two)
    sign_in @user
    @competitor = competitors(:two)
    @contest = contests(:two)
  end

  def test_should_get_index
    get contest_competitors_url(@contest)
    assert_response :success
  end

  def test_should_get_new
    get new_contest_competitor_url(@contest)
    assert_response :success
  end

  def test_should_create_competitor
    assert_difference('Competitor.count') do
      post contest_competitors_url(@contest), params: { competitor: {
          location: 'blah',
          fio1: @competitor.fio1, fio2: @competitor.fio2, fio3: @competitor.fio3
      } }
    end
    assert_redirected_to competitor_url(Competitor.last)
    assert_equal @user, Competitor.last.user
  end

  def test_should_show_competitor
    get competitor_url(@competitor)
    assert_response :success
  end

  def test_should_get_edit
    get edit_competitor_url(@competitor)
    assert_response :success
  end

  def test_should_update_competitor
    patch competitor_url(@competitor), params: { competitor: {
        location: 'blah',
        fio1: @competitor.fio1, fio2: @competitor.fio2, fio3: @competitor.fio3
    } }
    assert_redirected_to competitor_url(@competitor)
  end

  def test_should_destroy_competitor
    @competitor = competitors(:alone)

    assert_difference('Competitor.count', -1) do
      delete competitor_url(@competitor)
    end

    assert_redirected_to contest_competitors_url(@contest)
  end
end
