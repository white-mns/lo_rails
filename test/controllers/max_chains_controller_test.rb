require 'test_helper'

class MaxChainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @max_chain = max_chains(:one)
  end

  test "should get index" do
    get max_chains_url
    assert_response :success
  end

  test "should get new" do
    get new_max_chain_url
    assert_response :success
  end

  test "should create max_chain" do
    assert_difference('MaxChain.count') do
      post max_chains_url, params: { max_chain: { battle_page: @max_chain.battle_page, generate_no: @max_chain.generate_no, max_chain: @max_chain.max_chain, party: @max_chain.party, result_no: @max_chain.result_no } }
    end

    assert_redirected_to max_chain_url(MaxChain.last)
  end

  test "should show max_chain" do
    get max_chain_url(@max_chain)
    assert_response :success
  end

  test "should get edit" do
    get edit_max_chain_url(@max_chain)
    assert_response :success
  end

  test "should update max_chain" do
    patch max_chain_url(@max_chain), params: { max_chain: { battle_page: @max_chain.battle_page, generate_no: @max_chain.generate_no, max_chain: @max_chain.max_chain, party: @max_chain.party, result_no: @max_chain.result_no } }
    assert_redirected_to max_chain_url(@max_chain)
  end

  test "should destroy max_chain" do
    assert_difference('MaxChain.count', -1) do
      delete max_chain_url(@max_chain)
    end

    assert_redirected_to max_chains_url
  end
end
