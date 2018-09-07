require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { e_no: @item.e_no, effect: @item.effect, equip: @item.equip, generate_no: @item.generate_no, i_no: @item.i_no, kind: @item.kind, lv: @item.lv, name: @item.name, potency: @item.potency, potency_str: @item.potency_str, precision: @item.precision, result_no: @item.result_no } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { e_no: @item.e_no, effect: @item.effect, equip: @item.equip, generate_no: @item.generate_no, i_no: @item.i_no, kind: @item.kind, lv: @item.lv, name: @item.name, potency: @item.potency, potency_str: @item.potency_str, precision: @item.precision, result_no: @item.result_no } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to items_url
  end
end
