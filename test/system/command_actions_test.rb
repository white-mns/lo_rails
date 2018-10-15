require "application_system_test_case"

class CommandActionsTest < ApplicationSystemTestCase
  setup do
    @command_action = command_actions(:one)
  end

  test "visiting the index" do
    visit command_actions_url
    assert_selector "h1", text: "Command Actions"
  end

  test "creating a Command action" do
    visit command_actions_url
    click_on "New Command Action"

    fill_in "Act", with: @command_action.act
    fill_in "Card", with: @command_action.card_id
    fill_in "E No", with: @command_action.e_no
    fill_in "Generate No", with: @command_action.generate_no
    fill_in "Gowait", with: @command_action.gowait
    fill_in "Result No", with: @command_action.result_no
    fill_in "S No", with: @command_action.s_no
    fill_in "Timing", with: @command_action.timing
    click_on "Create Command action"

    assert_text "Command action was successfully created"
    click_on "Back"
  end

  test "updating a Command action" do
    visit command_actions_url
    click_on "Edit", match: :first

    fill_in "Act", with: @command_action.act
    fill_in "Card", with: @command_action.card_id
    fill_in "E No", with: @command_action.e_no
    fill_in "Generate No", with: @command_action.generate_no
    fill_in "Gowait", with: @command_action.gowait
    fill_in "Result No", with: @command_action.result_no
    fill_in "S No", with: @command_action.s_no
    fill_in "Timing", with: @command_action.timing
    click_on "Update Command action"

    assert_text "Command action was successfully updated"
    click_on "Back"
  end

  test "destroying a Command action" do
    visit command_actions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Command action was successfully destroyed"
  end
end
