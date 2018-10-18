require 'test_helper'

class CommandActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @command_action = command_actions(:one)
  end

  test "should get index" do
    get command_actions_url
    assert_response :success
  end

  test "should get new" do
    get new_command_action_url
    assert_response :success
  end

  test "should create command_action" do
    assert_difference('CommandAction.count') do
      post command_actions_url, params: { command_action: { act: @command_action.act, card_id: @command_action.card_id, e_no: @command_action.e_no, generate_no: @command_action.generate_no, gowait: @command_action.gowait, result_no: @command_action.result_no, s_no: @command_action.s_no, timing: @command_action.timing } }
    end

    assert_redirected_to command_action_url(CommandAction.last)
  end

  test "should show command_action" do
    get command_action_url(@command_action)
    assert_response :success
  end

  test "should get edit" do
    get edit_command_action_url(@command_action)
    assert_response :success
  end

  test "should update command_action" do
    patch command_action_url(@command_action), params: { command_action: { act: @command_action.act, card_id: @command_action.card_id, e_no: @command_action.e_no, generate_no: @command_action.generate_no, gowait: @command_action.gowait, result_no: @command_action.result_no, s_no: @command_action.s_no, timing: @command_action.timing } }
    assert_redirected_to command_action_url(@command_action)
  end

  test "should destroy command_action" do
    assert_difference('CommandAction.count', -1) do
      delete command_action_url(@command_action)
    end

    assert_redirected_to command_actions_url
  end
end
