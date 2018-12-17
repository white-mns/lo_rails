require 'test_helper'

class DamageBuffersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @damage_buffer = damage_buffers(:one)
  end

  test "should get index" do
    get damage_buffers_url
    assert_response :success
  end

  test "should get new" do
    get new_damage_buffer_url
    assert_response :success
  end

  test "should create damage_buffer" do
    assert_difference('DamageBuffer.count') do
      post damage_buffers_url, params: { damage_buffer: { act_id: @damage_buffer.act_id, battle_page: @damage_buffer.battle_page, buffer_id: @damage_buffer.buffer_id, e_no: @damage_buffer.e_no, generate_no: @damage_buffer.generate_no, lv: @damage_buffer.lv, result_no: @damage_buffer.result_no, value: @damage_buffer.value } }
    end

    assert_redirected_to damage_buffer_url(DamageBuffer.last)
  end

  test "should show damage_buffer" do
    get damage_buffer_url(@damage_buffer)
    assert_response :success
  end

  test "should get edit" do
    get edit_damage_buffer_url(@damage_buffer)
    assert_response :success
  end

  test "should update damage_buffer" do
    patch damage_buffer_url(@damage_buffer), params: { damage_buffer: { act_id: @damage_buffer.act_id, battle_page: @damage_buffer.battle_page, buffer_id: @damage_buffer.buffer_id, e_no: @damage_buffer.e_no, generate_no: @damage_buffer.generate_no, lv: @damage_buffer.lv, result_no: @damage_buffer.result_no, value: @damage_buffer.value } }
    assert_redirected_to damage_buffer_url(@damage_buffer)
  end

  test "should destroy damage_buffer" do
    assert_difference('DamageBuffer.count', -1) do
      delete damage_buffer_url(@damage_buffer)
    end

    assert_redirected_to damage_buffers_url
  end
end
