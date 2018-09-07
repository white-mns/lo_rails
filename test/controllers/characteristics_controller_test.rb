require 'test_helper'

class CharacteristicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @characteristic = characteristics(:one)
  end

  test "should get index" do
    get characteristics_url
    assert_response :success
  end

  test "should get new" do
    get new_characteristic_url
    assert_response :success
  end

  test "should create characteristic" do
    assert_difference('Characteristic.count') do
      post characteristics_url, params: { characteristic: { e_no: @characteristic.e_no, eva: @characteristic.eva, generate_no: @characteristic.generate_no, int: @characteristic.int, mnd: @characteristic.mnd, result_no: @characteristic.result_no, str: @characteristic.str, tec: @characteristic.tec, vit: @characteristic.vit } }
    end

    assert_redirected_to characteristic_url(Characteristic.last)
  end

  test "should show characteristic" do
    get characteristic_url(@characteristic)
    assert_response :success
  end

  test "should get edit" do
    get edit_characteristic_url(@characteristic)
    assert_response :success
  end

  test "should update characteristic" do
    patch characteristic_url(@characteristic), params: { characteristic: { e_no: @characteristic.e_no, eva: @characteristic.eva, generate_no: @characteristic.generate_no, int: @characteristic.int, mnd: @characteristic.mnd, result_no: @characteristic.result_no, str: @characteristic.str, tec: @characteristic.tec, vit: @characteristic.vit } }
    assert_redirected_to characteristic_url(@characteristic)
  end

  test "should destroy characteristic" do
    assert_difference('Characteristic.count', -1) do
      delete characteristic_url(@characteristic)
    end

    assert_redirected_to characteristics_url
  end
end
