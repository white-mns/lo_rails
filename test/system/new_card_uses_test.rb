require "application_system_test_case"

class NewCardUsesTest < ApplicationSystemTestCase
  setup do
    @new_card_use = new_card_uses(:one)
  end

  test "visiting the index" do
    visit new_card_uses_url
    assert_selector "h1", text: "New Card Uses"
  end

  test "creating a New card use" do
    visit new_card_uses_url
    click_on "New New Card Use"

    fill_in "Card", with: @new_card_use.card_id
    fill_in "Generate No", with: @new_card_use.generate_no
    fill_in "Result No", with: @new_card_use.result_no
    click_on "Create New card use"

    assert_text "New card use was successfully created"
    click_on "Back"
  end

  test "updating a New card use" do
    visit new_card_uses_url
    click_on "Edit", match: :first

    fill_in "Card", with: @new_card_use.card_id
    fill_in "Generate No", with: @new_card_use.generate_no
    fill_in "Result No", with: @new_card_use.result_no
    click_on "Update New card use"

    assert_text "New card use was successfully updated"
    click_on "Back"
  end

  test "destroying a New card use" do
    visit new_card_uses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "New card use was successfully destroyed"
  end
end
