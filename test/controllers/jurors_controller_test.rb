require "test_helper"

class JurorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @contest = contests(:one)
    @juror = jurors(:one)
    @juror_user = users(:three)
  end

  def test_should_get_index
    get contest_jurors_url(@contest)
    assert_response :success
  end

  def test_should_get_new
    get new_contest_juror_url(@contest)
    assert_response :success
  end

  def test_should_create_juror
    assert_difference("Juror.count") do
      post contest_jurors_url(@contest), params: {juror: {
        dob: @juror.dob,
        fio1: @juror.fio1, fio2: @juror.fio2, fio3: @juror.fio3,
        location: @juror.location,
        user_id: @juror_user.id
      }}
    end

    assert_redirected_to juror_url(Juror.last)
  end

  def test_should_show_juror
    get juror_url(@juror)
    assert_response :success
  end

  def test_should_get_edit
    get edit_juror_url(@juror)
    assert_response :success
  end

  def test_should_update_juror
    patch juror_url(@juror), params: {juror: {
      dob: @juror.dob,
      fio1: @juror.fio1, fio2: @juror.fio2, fio3: @juror.fio3,
      location: @juror.location,
      user_id: @juror_user.id
    }}
    assert_redirected_to juror_url(@juror)
  end

  def test_should_destroy_juror
    assert_difference("Juror.count", -1) do
      delete juror_url(@juror)
    end

    assert_redirected_to contest_jurors_url(@contest)
  end
end
