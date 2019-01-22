require 'test_helper'

class PreTotalPartyNumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pre_total_party_num = pre_total_party_nums(:one)
  end

  test "should get index" do
    get pre_total_party_nums_url
    assert_response :success
  end

  test "should get new" do
    get new_pre_total_party_num_url
    assert_response :success
  end

  test "should create pre_total_party_num" do
    assert_difference('PreTotalPartyNum.count') do
      post pre_total_party_nums_url, params: { pre_total_party_num: { count_type: @pre_total_party_num.count_type, e_no: @pre_total_party_num.e_no, generate_no: @pre_total_party_num.generate_no, party_num: @pre_total_party_num.party_num, result_no: @pre_total_party_num.result_no } }
    end

    assert_redirected_to pre_total_party_num_url(PreTotalPartyNum.last)
  end

  test "should show pre_total_party_num" do
    get pre_total_party_num_url(@pre_total_party_num)
    assert_response :success
  end

  test "should get edit" do
    get edit_pre_total_party_num_url(@pre_total_party_num)
    assert_response :success
  end

  test "should update pre_total_party_num" do
    patch pre_total_party_num_url(@pre_total_party_num), params: { pre_total_party_num: { count_type: @pre_total_party_num.count_type, e_no: @pre_total_party_num.e_no, generate_no: @pre_total_party_num.generate_no, party_num: @pre_total_party_num.party_num, result_no: @pre_total_party_num.result_no } }
    assert_redirected_to pre_total_party_num_url(@pre_total_party_num)
  end

  test "should destroy pre_total_party_num" do
    assert_difference('PreTotalPartyNum.count', -1) do
      delete pre_total_party_num_url(@pre_total_party_num)
    end

    assert_redirected_to pre_total_party_nums_url
  end
end
