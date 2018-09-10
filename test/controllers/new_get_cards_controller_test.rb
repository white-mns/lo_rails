require 'test_helper'

class NewGetCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @new_get_card = new_get_cards(:one)
  end

  test "should get index" do
    get new_get_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_new_get_card_url
    assert_response :success
  end

  test "should create new_get_card" do
    assert_difference('NewGetCard.count') do
      post new_get_cards_url, params: { new_get_card: { card_id: @new_get_card.card_id, generate_no: @new_get_card.generate_no, get_type: @new_get_card.get_type, result_no: @new_get_card.result_no } }
    end

    assert_redirected_to new_get_card_url(NewGetCard.last)
  end

  test "should show new_get_card" do
    get new_get_card_url(@new_get_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_new_get_card_url(@new_get_card)
    assert_response :success
  end

  test "should update new_get_card" do
    patch new_get_card_url(@new_get_card), params: { new_get_card: { card_id: @new_get_card.card_id, generate_no: @new_get_card.generate_no, get_type: @new_get_card.get_type, result_no: @new_get_card.result_no } }
    assert_redirected_to new_get_card_url(@new_get_card)
  end

  test "should destroy new_get_card" do
    assert_difference('NewGetCard.count', -1) do
      delete new_get_card_url(@new_get_card)
    end

    assert_redirected_to new_get_cards_url
  end
end
