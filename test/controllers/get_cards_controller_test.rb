require 'test_helper'

class GetCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @get_card = get_cards(:one)
  end

  test "should get index" do
    get get_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_get_card_url
    assert_response :success
  end

  test "should create get_card" do
    assert_difference('GetCard.count') do
      post get_cards_url, params: { get_card: { card_id: @get_card.card_id, e_no: @get_card.e_no, generate_no: @get_card.generate_no, get_type: @get_card.get_type, name: @get_card.name, result_no: @get_card.result_no } }
    end

    assert_redirected_to get_card_url(GetCard.last)
  end

  test "should show get_card" do
    get get_card_url(@get_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_get_card_url(@get_card)
    assert_response :success
  end

  test "should update get_card" do
    patch get_card_url(@get_card), params: { get_card: { card_id: @get_card.card_id, e_no: @get_card.e_no, generate_no: @get_card.generate_no, get_type: @get_card.get_type, name: @get_card.name, result_no: @get_card.result_no } }
    assert_redirected_to get_card_url(@get_card)
  end

  test "should destroy get_card" do
    assert_difference('GetCard.count', -1) do
      delete get_card_url(@get_card)
    end

    assert_redirected_to get_cards_url
  end
end
