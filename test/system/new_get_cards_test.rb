require "application_system_test_case"

class NewGetCardsTest < ApplicationSystemTestCase
  setup do
    @new_get_card = new_get_cards(:one)
  end

  test "visiting the index" do
    visit new_get_cards_url
    assert_selector "h1", text: "New Get Cards"
  end

  test "creating a New get card" do
    visit new_get_cards_url
    click_on "New New Get Card"

    fill_in "Card", with: @new_get_card.card_id
    fill_in "Generate No", with: @new_get_card.generate_no
    fill_in "Get Type", with: @new_get_card.get_type
    fill_in "Result No", with: @new_get_card.result_no
    click_on "Create New get card"

    assert_text "New get card was successfully created"
    click_on "Back"
  end

  test "updating a New get card" do
    visit new_get_cards_url
    click_on "Edit", match: :first

    fill_in "Card", with: @new_get_card.card_id
    fill_in "Generate No", with: @new_get_card.generate_no
    fill_in "Get Type", with: @new_get_card.get_type
    fill_in "Result No", with: @new_get_card.result_no
    click_on "Update New get card"

    assert_text "New get card was successfully updated"
    click_on "Back"
  end

  test "destroying a New get card" do
    visit new_get_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "New get card was successfully destroyed"
  end
end
