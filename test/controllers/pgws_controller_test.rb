require 'test_helper'

class PgwsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pgw = pgws(:one)
  end

  test "should get index" do
    get pgws_url
    assert_response :success
  end

  test "should get new" do
    get new_pgw_url
    assert_response :success
  end

  test "should create pgw" do
    assert_difference('Pgw.count') do
      post pgws_url, params: { pgw: { e_no: @pgw.e_no, generate_no: @pgw.generate_no, pgws_name_id: @pgw.pgws_name_id, pgws_type: @pgw.pgws_type, result_no: @pgw.result_no } }
    end

    assert_redirected_to pgw_url(Pgw.last)
  end

  test "should show pgw" do
    get pgw_url(@pgw)
    assert_response :success
  end

  test "should get edit" do
    get edit_pgw_url(@pgw)
    assert_response :success
  end

  test "should update pgw" do
    patch pgw_url(@pgw), params: { pgw: { e_no: @pgw.e_no, generate_no: @pgw.generate_no, pgws_name_id: @pgw.pgws_name_id, pgws_type: @pgw.pgws_type, result_no: @pgw.result_no } }
    assert_redirected_to pgw_url(@pgw)
  end

  test "should destroy pgw" do
    assert_difference('Pgw.count', -1) do
      delete pgw_url(@pgw)
    end

    assert_redirected_to pgws_url
  end
end
