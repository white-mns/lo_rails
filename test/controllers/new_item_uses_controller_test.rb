require 'test_helper'

class NewItemUsesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_item_use = new_item_uses(:one)
  end

  test "should get index" do
    get new_item_uses_url
    assert_response :success
  end

  test "should get new" do
    get new_new_item_use_url
    assert_response :success
  end

  test "should create new_item_use" do
    assert_difference('NewItemUse.count') do
      post new_item_uses_url, params: { new_item_use: { generate_no: @new_item_use.generate_no, name: @new_item_use.name, result_no: @new_item_use.result_no } }
    end

    assert_redirected_to new_item_use_url(NewItemUse.last)
  end

  test "should show new_item_use" do
    get new_item_use_url(@new_item_use)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_item_use_url(@new_item_use)
    assert_response :success
  end

  test "should update new_item_use" do
    patch new_item_use_url(@new_item_use), params: { new_item_use: { generate_no: @new_item_use.generate_no, name: @new_item_use.name, result_no: @new_item_use.result_no } }
    assert_redirected_to new_item_use_url(@new_item_use)
  end

  test "should destroy new_item_use" do
    assert_difference('NewItemUse.count', -1) do
      delete new_item_use_url(@new_item_use)
    end

    assert_redirected_to new_item_uses_url
  end
end
