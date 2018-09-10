require 'test_helper'

class CardUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_user = card_users(:one)
  end

  test "should get index" do
    get card_users_url
    assert_response :success
  end

  test "should get new" do
    get new_card_user_url
    assert_response :success
  end

  test "should create card_user" do
    assert_difference('CardUser.count') do
      post card_users_url, params: { card_user: { battle_page: @card_user.battle_page, card_id: @card_user.card_id, control: @card_user.control, e_no: @card_user.e_no, generate_no: @card_user.generate_no, party: @card_user.party, result_no: @card_user.result_no, success: @card_user.success } }
    end

    assert_redirected_to card_user_url(CardUser.last)
  end

  test "should show card_user" do
    get card_user_url(@card_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_card_user_url(@card_user)
    assert_response :success
  end

  test "should update card_user" do
    patch card_user_url(@card_user), params: { card_user: { battle_page: @card_user.battle_page, card_id: @card_user.card_id, control: @card_user.control, e_no: @card_user.e_no, generate_no: @card_user.generate_no, party: @card_user.party, result_no: @card_user.result_no, success: @card_user.success } }
    assert_redirected_to card_user_url(@card_user)
  end

  test "should destroy card_user" do
    assert_difference('CardUser.count', -1) do
      delete card_user_url(@card_user)
    end

    assert_redirected_to card_users_url
  end
end
