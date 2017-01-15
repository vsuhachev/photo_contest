require 'test_helper'

class JurorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    sign_in @user
    @contest = contests(:one)
    @juror = jurors(:one)
    @juror_user = users(:three)
  end

  test "should get index" do
    get contest_jurors_url(@contest)
    assert_response :success
  end

  test "should get new" do
    get new_contest_juror_url(@contest)
    assert_response :success
  end

  test "should create juror" do
    assert_difference('Juror.count') do
      post contest_jurors_url(@contest), params: { juror: {
          dob: @juror.dob,
          fio1: @juror.fio1, fio2: @juror.fio2, fio3: @juror.fio3,
          location: @juror.location,
          user_id: @juror_user.id
      } }
    end

    assert_redirected_to juror_url(Juror.last)
  end

  test "should show juror" do
    get juror_url(@juror)
    assert_response :success
  end

  test "should get edit" do
    get edit_juror_url(@juror)
    assert_response :success
  end

  test "should update juror" do
    patch juror_url(@juror), params: { juror: {
        dob: @juror.dob,
        fio1: @juror.fio1, fio2: @juror.fio2, fio3: @juror.fio3,
        location: @juror.location,
        user_id: @juror_user.id
    } }
    assert_redirected_to juror_url(@juror)
  end

  test "should destroy juror" do
    assert_difference('Juror.count', -1) do
      delete juror_url(@juror)
    end

    assert_redirected_to contest_jurors_url(@contest)
  end
end
