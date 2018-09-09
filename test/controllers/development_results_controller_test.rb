require 'test_helper'

class DevelopmentResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @development_result = development_results(:one)
  end

  test "should get index" do
    get development_results_url
    assert_response :success
  end

  test "should get new" do
    get new_development_result_url
    assert_response :success
  end

  test "should create development_result" do
    assert_difference('DevelopmentResult.count') do
      post development_results_url, params: { development_result: { bellicose: @development_result.bellicose, development_result: @development_result.development_result, e_no: @development_result.e_no, generate_no: @development_result.generate_no, party_num: @development_result.party_num, result_no: @development_result.result_no } }
    end

    assert_redirected_to development_result_url(DevelopmentResult.last)
  end

  test "should show development_result" do
    get development_result_url(@development_result)
    assert_response :success
  end

  test "should get edit" do
    get edit_development_result_url(@development_result)
    assert_response :success
  end

  test "should update development_result" do
    patch development_result_url(@development_result), params: { development_result: { bellicose: @development_result.bellicose, development_result: @development_result.development_result, e_no: @development_result.e_no, generate_no: @development_result.generate_no, party_num: @development_result.party_num, result_no: @development_result.result_no } }
    assert_redirected_to development_result_url(@development_result)
  end

  test "should destroy development_result" do
    assert_difference('DevelopmentResult.count', -1) do
      delete development_result_url(@development_result)
    end

    assert_redirected_to development_results_url
  end
end
