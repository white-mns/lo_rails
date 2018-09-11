require 'test_helper'

class NewCardUsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_card_use = new_card_uses(:one)
  end

  test "should get index" do
    get new_card_uses_url
    assert_response :success
  end

  test "should get new" do
    get new_new_card_use_url
    assert_response :success
  end

  test "should create new_card_use" do
    assert_difference('NewCardUse.count') do
      post new_card_uses_url, params: { new_card_use: { card_id: @new_card_use.card_id, generate_no: @new_card_use.generate_no, result_no: @new_card_use.result_no } }
    end

    assert_redirected_to new_card_use_url(NewCardUse.last)
  end

  test "should show new_card_use" do
    get new_card_use_url(@new_card_use)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_card_use_url(@new_card_use)
    assert_response :success
  end

  test "should update new_card_use" do
    patch new_card_use_url(@new_card_use), params: { new_card_use: { card_id: @new_card_use.card_id, generate_no: @new_card_use.generate_no, result_no: @new_card_use.result_no } }
    assert_redirected_to new_card_use_url(@new_card_use)
  end

  test "should destroy new_card_use" do
    assert_difference('NewCardUse.count', -1) do
      delete new_card_use_url(@new_card_use)
    end

    assert_redirected_to new_card_uses_url
  end
end
