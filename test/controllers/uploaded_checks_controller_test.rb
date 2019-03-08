require 'test_helper'

class UploadedChecksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @uploaded_check = uploaded_checks(:one)
  end

  test "should get index" do
    get uploaded_checks_url
    assert_response :success
  end

  test "should get new" do
    get new_uploaded_check_url
    assert_response :success
  end

  test "should create uploaded_check" do
    assert_difference('UploadedCheck.count') do
      post uploaded_checks_url, params: { uploaded_check: { generate_no: @uploaded_check.generate_no, result_no: @uploaded_check.result_no } }
    end

    assert_redirected_to uploaded_check_url(UploadedCheck.last)
  end

  test "should show uploaded_check" do
    get uploaded_check_url(@uploaded_check)
    assert_response :success
  end

  test "should get edit" do
    get edit_uploaded_check_url(@uploaded_check)
    assert_response :success
  end

  test "should update uploaded_check" do
    patch uploaded_check_url(@uploaded_check), params: { uploaded_check: { generate_no: @uploaded_check.generate_no, result_no: @uploaded_check.result_no } }
    assert_redirected_to uploaded_check_url(@uploaded_check)
  end

  test "should destroy uploaded_check" do
    assert_difference('UploadedCheck.count', -1) do
      delete uploaded_check_url(@uploaded_check)
    end

    assert_redirected_to uploaded_checks_url
  end
end
