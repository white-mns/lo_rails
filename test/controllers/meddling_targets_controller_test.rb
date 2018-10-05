require 'test_helper'

class MeddlingTargetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meddling_target = meddling_targets(:one)
  end

  test "should get index" do
    get meddling_targets_url
    assert_response :success
  end

  test "should get new" do
    get new_meddling_target_url
    assert_response :success
  end

  test "should create meddling_target" do
    assert_difference('MeddlingTarget.count') do
      post meddling_targets_url, params: { meddling_target: { card_id: @meddling_target.card_id, chain: @meddling_target.chain, count: @meddling_target.count, e_no: @meddling_target.e_no, generate_no: @meddling_target.generate_no, result_no: @meddling_target.result_no, target_id: @meddling_target.target_id } }
    end

    assert_redirected_to meddling_target_url(MeddlingTarget.last)
  end

  test "should show meddling_target" do
    get meddling_target_url(@meddling_target)
    assert_response :success
  end

  test "should get edit" do
    get edit_meddling_target_url(@meddling_target)
    assert_response :success
  end

  test "should update meddling_target" do
    patch meddling_target_url(@meddling_target), params: { meddling_target: { card_id: @meddling_target.card_id, chain: @meddling_target.chain, count: @meddling_target.count, e_no: @meddling_target.e_no, generate_no: @meddling_target.generate_no, result_no: @meddling_target.result_no, target_id: @meddling_target.target_id } }
    assert_redirected_to meddling_target_url(@meddling_target)
  end

  test "should destroy meddling_target" do
    assert_difference('MeddlingTarget.count', -1) do
      delete meddling_target_url(@meddling_target)
    end

    assert_redirected_to meddling_targets_url
  end
end
