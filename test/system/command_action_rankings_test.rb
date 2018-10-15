require "application_system_test_case"

class CommandActionRankingsTest < ApplicationSystemTestCase
  setup do
    @command_action_ranking = command_action_rankings(:one)
  end

  test "visiting the index" do
    visit command_action_rankings_url
    assert_selector "h1", text: "Command Action Rankings"
  end

  test "creating a Command action ranking" do
    visit command_action_rankings_url
    click_on "New Command Action Ranking"

    fill_in "Card", with: @command_action_ranking.card_id
    fill_in "Generate No", with: @command_action_ranking.generate_no
    fill_in "Num", with: @command_action_ranking.num
    fill_in "Rank", with: @command_action_ranking.rank
    fill_in "Rank Type", with: @command_action_ranking.rank_type
    fill_in "Result No", with: @command_action_ranking.result_no
    click_on "Create Command action ranking"

    assert_text "Command action ranking was successfully created"
    click_on "Back"
  end

  test "updating a Command action ranking" do
    visit command_action_rankings_url
    click_on "Edit", match: :first

    fill_in "Card", with: @command_action_ranking.card_id
    fill_in "Generate No", with: @command_action_ranking.generate_no
    fill_in "Num", with: @command_action_ranking.num
    fill_in "Rank", with: @command_action_ranking.rank
    fill_in "Rank Type", with: @command_action_ranking.rank_type
    fill_in "Result No", with: @command_action_ranking.result_no
    click_on "Update Command action ranking"

    assert_text "Command action ranking was successfully updated"
    click_on "Back"
  end

  test "destroying a Command action ranking" do
    visit command_action_rankings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Command action ranking was successfully destroyed"
  end
end
