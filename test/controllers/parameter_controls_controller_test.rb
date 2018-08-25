require 'test_helper'

class ParameterControlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parameter_control = parameter_controls(:one)
  end

  test "should get index" do
    get parameter_controls_url
    assert_response :success
  end

  test "should get new" do
    get new_parameter_control_url
    assert_response :success
  end

  test "should create parameter_control" do
    assert_difference('ParameterControl.count') do
      post parameter_controls_url, params: { parameter_control: { cond: @parameter_control.cond, cvp: @parameter_control.cvp, day: @parameter_control.day, e_no: @parameter_control.e_no, generate_no: @parameter_control.generate_no, mod: @parameter_control.mod, pvp: @parameter_control.pvp, result_no: @parameter_control.result_no } }
    end

    assert_redirected_to parameter_control_url(ParameterControl.last)
  end

  test "should show parameter_control" do
    get parameter_control_url(@parameter_control)
    assert_response :success
  end

  test "should get edit" do
    get edit_parameter_control_url(@parameter_control)
    assert_response :success
  end

  test "should update parameter_control" do
    patch parameter_control_url(@parameter_control), params: { parameter_control: { cond: @parameter_control.cond, cvp: @parameter_control.cvp, day: @parameter_control.day, e_no: @parameter_control.e_no, generate_no: @parameter_control.generate_no, mod: @parameter_control.mod, pvp: @parameter_control.pvp, result_no: @parameter_control.result_no } }
    assert_redirected_to parameter_control_url(@parameter_control)
  end

  test "should destroy parameter_control" do
    assert_difference('ParameterControl.count', -1) do
      delete parameter_control_url(@parameter_control)
    end

    assert_redirected_to parameter_controls_url
  end
end
