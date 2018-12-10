require 'test_helper'

class PreWinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pre_win = pre_wins(:one)
  end

  test "should get index" do
    get pre_wins_url
    assert_response :success
  end

  test "should get new" do
    get new_pre_win_url
    assert_response :success
  end

  test "should create pre_win" do
    assert_difference('PreWin.count') do
      post pre_wins_url, params: { pre_win: { all: @pre_win.all, draw: @pre_win.draw, e_no: @pre_win.e_no, generate_no: @pre_win.generate_no, lose: @pre_win.lose, result_no: @pre_win.result_no, win: @pre_win.win } }
    end

    assert_redirected_to pre_win_url(PreWin.last)
  end

  test "should show pre_win" do
    get pre_win_url(@pre_win)
    assert_response :success
  end

  test "should get edit" do
    get edit_pre_win_url(@pre_win)
    assert_response :success
  end

  test "should update pre_win" do
    patch pre_win_url(@pre_win), params: { pre_win: { all: @pre_win.all, draw: @pre_win.draw, e_no: @pre_win.e_no, generate_no: @pre_win.generate_no, lose: @pre_win.lose, result_no: @pre_win.result_no, win: @pre_win.win } }
    assert_redirected_to pre_win_url(@pre_win)
  end

  test "should destroy pre_win" do
    assert_difference('PreWin.count', -1) do
      delete pre_win_url(@pre_win)
    end

    assert_redirected_to pre_wins_url
  end
end
