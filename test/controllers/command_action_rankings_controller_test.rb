require 'test_helper'

class CommandActionRankingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @command_action_ranking = command_action_rankings(:one)
  end

  test "should get index" do
    get command_action_rankings_url
    assert_response :success
  end

  test "should get new" do
    get new_command_action_ranking_url
    assert_response :success
  end

  test "should create command_action_ranking" do
    assert_difference('CommandActionRanking.count') do
      post command_action_rankings_url, params: { command_action_ranking: { card_id: @command_action_ranking.card_id, generate_no: @command_action_ranking.generate_no, num: @command_action_ranking.num, rank: @command_action_ranking.rank, rank_type: @command_action_ranking.rank_type, result_no: @command_action_ranking.result_no } }
    end

    assert_redirected_to command_action_ranking_url(CommandActionRanking.last)
  end

  test "should show command_action_ranking" do
    get command_action_ranking_url(@command_action_ranking)
    assert_response :success
  end

  test "should get edit" do
    get edit_command_action_ranking_url(@command_action_ranking)
    assert_response :success
  end

  test "should update command_action_ranking" do
    patch command_action_ranking_url(@command_action_ranking), params: { command_action_ranking: { card_id: @command_action_ranking.card_id, generate_no: @command_action_ranking.generate_no, num: @command_action_ranking.num, rank: @command_action_ranking.rank, rank_type: @command_action_ranking.rank_type, result_no: @command_action_ranking.result_no } }
    assert_redirected_to command_action_ranking_url(@command_action_ranking)
  end

  test "should destroy command_action_ranking" do
    assert_difference('CommandActionRanking.count', -1) do
      delete command_action_ranking_url(@command_action_ranking)
    end

    assert_redirected_to command_action_rankings_url
  end
end
