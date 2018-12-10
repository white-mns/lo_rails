require "application_system_test_case"

class PreWinsTest < ApplicationSystemTestCase
  setup do
    @pre_win = pre_wins(:one)
  end

  test "visiting the index" do
    visit pre_wins_url
    assert_selector "h1", text: "Pre Wins"
  end

  test "creating a Pre win" do
    visit pre_wins_url
    click_on "New Pre Win"

    fill_in "All", with: @pre_win.all
    fill_in "Draw", with: @pre_win.draw
    fill_in "E No", with: @pre_win.e_no
    fill_in "Generate No", with: @pre_win.generate_no
    fill_in "Lose", with: @pre_win.lose
    fill_in "Result No", with: @pre_win.result_no
    fill_in "Win", with: @pre_win.win
    click_on "Create Pre win"

    assert_text "Pre win was successfully created"
    click_on "Back"
  end

  test "updating a Pre win" do
    visit pre_wins_url
    click_on "Edit", match: :first

    fill_in "All", with: @pre_win.all
    fill_in "Draw", with: @pre_win.draw
    fill_in "E No", with: @pre_win.e_no
    fill_in "Generate No", with: @pre_win.generate_no
    fill_in "Lose", with: @pre_win.lose
    fill_in "Result No", with: @pre_win.result_no
    fill_in "Win", with: @pre_win.win
    click_on "Update Pre win"

    assert_text "Pre win was successfully updated"
    click_on "Back"
  end

  test "destroying a Pre win" do
    visit pre_wins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pre win was successfully destroyed"
  end
end
