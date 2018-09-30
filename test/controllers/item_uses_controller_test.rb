require 'test_helper'

class ItemUsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_use = item_uses(:one)
  end

  test "should get index" do
    get item_uses_url
    assert_response :success
  end

  test "should get new" do
    get new_item_use_url
    assert_response :success
  end

  test "should create item_use" do
    assert_difference('ItemUse.count') do
      post item_uses_url, params: { item_use: { e_no: @item_use.e_no, generate_no: @item_use.generate_no, i_no: @item_use.i_no, name: @item_use.name, result_no: @item_use.result_no } }
    end

    assert_redirected_to item_use_url(ItemUse.last)
  end

  test "should show item_use" do
    get item_use_url(@item_use)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_use_url(@item_use)
    assert_response :success
  end

  test "should update item_use" do
    patch item_use_url(@item_use), params: { item_use: { e_no: @item_use.e_no, generate_no: @item_use.generate_no, i_no: @item_use.i_no, name: @item_use.name, result_no: @item_use.result_no } }
    assert_redirected_to item_use_url(@item_use)
  end

  test "should destroy item_use" do
    assert_difference('ItemUse.count', -1) do
      delete item_use_url(@item_use)
    end

    assert_redirected_to item_uses_url
  end
end
