require 'test_helper'

class DamagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @damage = damages(:one)
  end

  test "should get index" do
    get damages_url
    assert_response :success
  end

  test "should get new" do
    get new_damage_url
    assert_response :success
  end

  test "should create damage" do
    assert_difference('Damage.count') do
      post damages_url, params: { damage: { act_type: @damage.act_type, battle_page: @damage.battle_page, card_id: @damage.card_id, chain: @damage.chain, damage: @damage.damage, e_no: @damage.e_no, element: @damage.element, generate_no: @damage.generate_no, is_absorb: @damage.is_absorb, is_clean: @damage.is_clean, is_critical: @damage.is_critical, is_vanish: @damage.is_vanish, is_weak: @damage.is_weak, party: @damage.party, result_no: @damage.result_no, target_e_no: @damage.target_e_no, target_party: @damage.target_party } }
    end

    assert_redirected_to damage_url(Damage.last)
  end

  test "should show damage" do
    get damage_url(@damage)
    assert_response :success
  end

  test "should get edit" do
    get edit_damage_url(@damage)
    assert_response :success
  end

  test "should update damage" do
    patch damage_url(@damage), params: { damage: { act_type: @damage.act_type, battle_page: @damage.battle_page, card_id: @damage.card_id, chain: @damage.chain, damage: @damage.damage, e_no: @damage.e_no, element: @damage.element, generate_no: @damage.generate_no, is_absorb: @damage.is_absorb, is_clean: @damage.is_clean, is_critical: @damage.is_critical, is_vanish: @damage.is_vanish, is_weak: @damage.is_weak, party: @damage.party, result_no: @damage.result_no, target_e_no: @damage.target_e_no, target_party: @damage.target_party } }
    assert_redirected_to damage_url(@damage)
  end

  test "should destroy damage" do
    assert_difference('Damage.count', -1) do
      delete damage_url(@damage)
    end

    assert_redirected_to damages_url
  end
end
