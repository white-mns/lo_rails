require 'test_helper'

class MeddlingSuccessRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meddling_success_rate = meddling_success_rates(:one)
  end

  test "should get index" do
    get meddling_success_rates_url
    assert_response :success
  end

  test "should get new" do
    get new_meddling_success_rate_url
    assert_response :success
  end

  test "should create meddling_success_rate" do
    assert_difference('MeddlingSuccessRate.count') do
      post meddling_success_rates_url, params: { meddling_success_rate: { card_id: @meddling_success_rate.card_id, chain: @meddling_success_rate.chain, e_no: @meddling_success_rate.e_no, generate_no: @meddling_success_rate.generate_no, miss: @meddling_success_rate.miss, no_apply: @meddling_success_rate.no_apply, rate: @meddling_success_rate.rate, result_no: @meddling_success_rate.result_no, success: @meddling_success_rate.success, sum: @meddling_success_rate.sum } }
    end

    assert_redirected_to meddling_success_rate_url(MeddlingSuccessRate.last)
  end

  test "should show meddling_success_rate" do
    get meddling_success_rate_url(@meddling_success_rate)
    assert_response :success
  end

  test "should get edit" do
    get edit_meddling_success_rate_url(@meddling_success_rate)
    assert_response :success
  end

  test "should update meddling_success_rate" do
    patch meddling_success_rate_url(@meddling_success_rate), params: { meddling_success_rate: { card_id: @meddling_success_rate.card_id, chain: @meddling_success_rate.chain, e_no: @meddling_success_rate.e_no, generate_no: @meddling_success_rate.generate_no, miss: @meddling_success_rate.miss, no_apply: @meddling_success_rate.no_apply, rate: @meddling_success_rate.rate, result_no: @meddling_success_rate.result_no, success: @meddling_success_rate.success, sum: @meddling_success_rate.sum } }
    assert_redirected_to meddling_success_rate_url(@meddling_success_rate)
  end

  test "should destroy meddling_success_rate" do
    assert_difference('MeddlingSuccessRate.count', -1) do
      delete meddling_success_rate_url(@meddling_success_rate)
    end

    assert_redirected_to meddling_success_rates_url
  end
end
