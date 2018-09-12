require 'test_helper'

class FacilityDivisionDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facility_division_datum = facility_division_data(:one)
  end

  test "should get index" do
    get facility_division_data_url
    assert_response :success
  end

  test "should get new" do
    get new_facility_division_datum_url
    assert_response :success
  end

  test "should create facility_division_datum" do
    assert_difference('FacilityDivisionDatum.count') do
      post facility_division_data_url, params: { facility_division_datum: { detail: @facility_division_datum.detail, division_id: @facility_division_datum.division_id, major: @facility_division_datum.major } }
    end

    assert_redirected_to facility_division_datum_url(FacilityDivisionDatum.last)
  end

  test "should show facility_division_datum" do
    get facility_division_datum_url(@facility_division_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_facility_division_datum_url(@facility_division_datum)
    assert_response :success
  end

  test "should update facility_division_datum" do
    patch facility_division_datum_url(@facility_division_datum), params: { facility_division_datum: { detail: @facility_division_datum.detail, division_id: @facility_division_datum.division_id, major: @facility_division_datum.major } }
    assert_redirected_to facility_division_datum_url(@facility_division_datum)
  end

  test "should destroy facility_division_datum" do
    assert_difference('FacilityDivisionDatum.count', -1) do
      delete facility_division_datum_url(@facility_division_datum)
    end

    assert_redirected_to facility_division_data_url
  end
end
