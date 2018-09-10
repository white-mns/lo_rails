require 'test_helper'

class CardUsePagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_use_page = card_use_pages(:one)
  end

  test "should get index" do
    get card_use_pages_url
    assert_response :success
  end

  test "should get new" do
    get new_card_use_page_url
    assert_response :success
  end

  test "should create card_use_page" do
    assert_difference('CardUsePage.count') do
      post card_use_pages_url, params: { card_use_page: { battle_page: @card_use_page.battle_page, generate_no: @card_use_page.generate_no, party: @card_use_page.party, result_no: @card_use_page.result_no, use_cards: @card_use_page.use_cards } }
    end

    assert_redirected_to card_use_page_url(CardUsePage.last)
  end

  test "should show card_use_page" do
    get card_use_page_url(@card_use_page)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_use_page_url(@card_use_page)
    assert_response :success
  end

  test "should update card_use_page" do
    patch card_use_page_url(@card_use_page), params: { card_use_page: { battle_page: @card_use_page.battle_page, generate_no: @card_use_page.generate_no, party: @card_use_page.party, result_no: @card_use_page.result_no, use_cards: @card_use_page.use_cards } }
    assert_redirected_to card_use_page_url(@card_use_page)
  end

  test "should destroy card_use_page" do
    assert_difference('CardUsePage.count', -1) do
      delete card_use_page_url(@card_use_page)
    end

    assert_redirected_to card_use_pages_url
  end
end
