require 'test_helper'

class ParameterDevelopmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parameter_development = parameter_developments(:one)
  end

  test "should get index" do
    get parameter_developments_url
    assert_response :success
  end

  test "should get new" do
    get new_parameter_development_url
    assert_response :success
  end

  test "should create parameter_development" do
    assert_difference('ParameterDevelopment.count') do
      post parameter_developments_url, params: { parameter_development: { cond: @parameter_development.cond, e_no: @parameter_development.e_no, generate_no: @parameter_development.generate_no, lv: @parameter_development.lv, mfp: @parameter_development.mfp, mlp: @parameter_development.mlp, rank: @parameter_development.rank, result_no: @parameter_development.result_no } }
    end

    assert_redirected_to parameter_development_url(ParameterDevelopment.last)
  end

  test "should show parameter_development" do
    get parameter_development_url(@parameter_development)
    assert_response :success
  end

  test "should get edit" do
    get edit_parameter_development_url(@parameter_development)
    assert_response :success
  end

  test "should update parameter_development" do
    patch parameter_development_url(@parameter_development), params: { parameter_development: { cond: @parameter_development.cond, e_no: @parameter_development.e_no, generate_no: @parameter_development.generate_no, lv: @parameter_development.lv, mfp: @parameter_development.mfp, mlp: @parameter_development.mlp, rank: @parameter_development.rank, result_no: @parameter_development.result_no } }
    assert_redirected_to parameter_development_url(@parameter_development)
  end

  test "should destroy parameter_development" do
    assert_difference('ParameterDevelopment.count', -1) do
      delete parameter_development_url(@parameter_development)
    end

    assert_redirected_to parameter_developments_url
  end
end
