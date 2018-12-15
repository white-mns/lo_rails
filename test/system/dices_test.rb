require "application_system_test_case"

class DicesTest < ApplicationSystemTestCase
  setup do
    @dice = dices(:one)
  end

  test "visiting the index" do
    visit dices_url
    assert_selector "h1", text: "Dices"
  end

  test "creating a Dice" do
    visit dices_url
    click_on "New Dice"

    fill_in "Dice", with: @dice.dice
    fill_in "E No", with: @dice.e_no
    fill_in "Generate No", with: @dice.generate_no
    fill_in "Number", with: @dice.number
    fill_in "Result No", with: @dice.result_no
    fill_in "Use Item", with: @dice.use_item
    click_on "Create Dice"

    assert_text "Dice was successfully created"
    click_on "Back"
  end

  test "updating a Dice" do
    visit dices_url
    click_on "Edit", match: :first

    fill_in "Dice", with: @dice.dice
    fill_in "E No", with: @dice.e_no
    fill_in "Generate No", with: @dice.generate_no
    fill_in "Number", with: @dice.number
    fill_in "Result No", with: @dice.result_no
    fill_in "Use Item", with: @dice.use_item
    click_on "Update Dice"

    assert_text "Dice was successfully updated"
    click_on "Back"
  end

  test "destroying a Dice" do
    visit dices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dice was successfully destroyed"
  end
end
