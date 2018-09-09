require 'test_helper'

class FacilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facility = facilities(:one)
  end

  test "should get index" do
    get facilities_url
    assert_response :success
  end

  test "should get new" do
    get new_facility_url
    assert_response :success
  end

  test "should create facility" do
    assert_difference('Facility.count') do
      post facilities_url, params: { facility: { detail_division: @facility.detail_division, division: @facility.division, e_no: @facility.e_no, generate_no: @facility.generate_no, holiday: @facility.holiday, lv: @facility.lv, name: @facility.name, period: @facility.period, result_no: @facility.result_no, set_col: @facility.set_col, set_lv: @facility.set_lv, value: @facility.value } }
    end

    assert_redirected_to facility_url(Facility.last)
  end

  test "should show facility" do
    get facility_url(@facility)
    assert_response :success
  end

  test "should get edit" do
    get edit_facility_url(@facility)
    assert_response :success
  end

  test "should update facility" do
    patch facility_url(@facility), params: { facility: { detail_division: @facility.detail_division, division: @facility.division, e_no: @facility.e_no, generate_no: @facility.generate_no, holiday: @facility.holiday, lv: @facility.lv, name: @facility.name, period: @facility.period, result_no: @facility.result_no, set_col: @facility.set_col, set_lv: @facility.set_lv, value: @facility.value } }
    assert_redirected_to facility_url(@facility)
  end

  test "should destroy facility" do
    assert_difference('Facility.count', -1) do
      delete facility_url(@facility)
    end

    assert_redirected_to facilities_url
  end
end
