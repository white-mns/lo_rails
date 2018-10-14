require 'test_helper'

class FacilityUsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facility_use = facility_uses(:one)
  end

  test "should get index" do
    get facility_uses_url
    assert_response :success
  end

  test "should get new" do
    get new_facility_use_url
    assert_response :success
  end

  test "should create facility_use" do
    assert_difference('FacilityUse.count') do
      post facility_uses_url, params: { facility_use: { cost: @facility_use.cost, e_no: @facility_use.e_no, facility_e_no: @facility_use.facility_e_no, facility_effect: @facility_use.facility_effect, facility_lv: @facility_use.facility_lv, facility_name: @facility_use.facility_name, generate_no: @facility_use.generate_no, result_no: @facility_use.result_no, success: @facility_use.success, usage: @facility_use.usage } }
    end

    assert_redirected_to facility_use_url(FacilityUse.last)
  end

  test "should show facility_use" do
    get facility_use_url(@facility_use)
    assert_response :success
  end

  test "should get edit" do
    get edit_facility_use_url(@facility_use)
    assert_response :success
  end

  test "should update facility_use" do
    patch facility_use_url(@facility_use), params: { facility_use: { cost: @facility_use.cost, e_no: @facility_use.e_no, facility_e_no: @facility_use.facility_e_no, facility_effect: @facility_use.facility_effect, facility_lv: @facility_use.facility_lv, facility_name: @facility_use.facility_name, generate_no: @facility_use.generate_no, result_no: @facility_use.result_no, success: @facility_use.success, usage: @facility_use.usage } }
    assert_redirected_to facility_use_url(@facility_use)
  end

  test "should destroy facility_use" do
    assert_difference('FacilityUse.count', -1) do
      delete facility_use_url(@facility_use)
    end

    assert_redirected_to facility_uses_url
  end
end
