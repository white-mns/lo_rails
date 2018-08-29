require 'test_helper'

class CardDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_datum = card_data(:one)
  end

  test "should get index" do
    get card_data_url
    assert_response :success
  end

  test "should get new" do
    get new_card_datum_url
    assert_response :success
  end

  test "should create card_datum" do
    assert_difference('CardDatum.count') do
      post card_data_url, params: { card_datum: { card_id: @card_datum.card_id, fp: @card_datum.fp, lp: @card_datum.lp, lv: @card_datum.lv, name: @card_datum.name } }
    end

    assert_redirected_to card_datum_url(CardDatum.last)
  end

  test "should show card_datum" do
    get card_datum_url(@card_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_datum_url(@card_datum)
    assert_response :success
  end

  test "should update card_datum" do
    patch card_datum_url(@card_datum), params: { card_datum: { card_id: @card_datum.card_id, fp: @card_datum.fp, lp: @card_datum.lp, lv: @card_datum.lv, name: @card_datum.name } }
    assert_redirected_to card_datum_url(@card_datum)
  end

  test "should destroy card_datum" do
    assert_difference('CardDatum.count', -1) do
      delete card_datum_url(@card_datum)
    end

    assert_redirected_to card_data_url
  end
end
