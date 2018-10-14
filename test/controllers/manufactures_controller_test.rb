require 'test_helper'

class ManufacturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manufacture = manufactures(:one)
  end

  test "should get index" do
    get manufactures_url
    assert_response :success
  end

  test "should get new" do
    get new_manufacture_url
    assert_response :success
  end

  test "should create manufacture" do
    assert_difference('Manufacture.count') do
      post manufactures_url, params: { manufacture: { cost: @manufacture.cost, e_no: @manufacture.e_no, effect: @manufacture.effect, effect_lv: @manufacture.effect_lv, facility_e_no: @manufacture.facility_e_no, facility_effect: @manufacture.facility_effect, facility_lv: @manufacture.facility_lv, facility_name: @manufacture.facility_name, generate_no: @manufacture.generate_no, item_name: @manufacture.item_name, kind: @manufacture.kind, potency: @manufacture.potency, precision: @manufacture.precision, result_no: @manufacture.result_no, total: @manufacture.total, usage: @manufacture.usage } }
    end

    assert_redirected_to manufacture_url(Manufacture.last)
  end

  test "should show manufacture" do
    get manufacture_url(@manufacture)
    assert_response :success
  end

  test "should get edit" do
    get edit_manufacture_url(@manufacture)
    assert_response :success
  end

  test "should update manufacture" do
    patch manufacture_url(@manufacture), params: { manufacture: { cost: @manufacture.cost, e_no: @manufacture.e_no, effect: @manufacture.effect, effect_lv: @manufacture.effect_lv, facility_e_no: @manufacture.facility_e_no, facility_effect: @manufacture.facility_effect, facility_lv: @manufacture.facility_lv, facility_name: @manufacture.facility_name, generate_no: @manufacture.generate_no, item_name: @manufacture.item_name, kind: @manufacture.kind, potency: @manufacture.potency, precision: @manufacture.precision, result_no: @manufacture.result_no, total: @manufacture.total, usage: @manufacture.usage } }
    assert_redirected_to manufacture_url(@manufacture)
  end

  test "should destroy manufacture" do
    assert_difference('Manufacture.count', -1) do
      delete manufacture_url(@manufacture)
    end

    assert_redirected_to manufactures_url
  end
end
