require "application_system_test_case"

class GetCardsTest < ApplicationSystemTestCase
  setup do
    @get_card = get_cards(:one)
  end

  test "visiting the index" do
    visit get_cards_url
    assert_selector "h1", text: "Get Cards"
  end

  test "creating a Get card" do
    visit get_cards_url
    click_on "New Get Card"

    fill_in "Card", with: @get_card.card_id
    fill_in "E No", with: @get_card.e_no
    fill_in "Generate No", with: @get_card.generate_no
    fill_in "Get Type", with: @get_card.get_type
    fill_in "Name", with: @get_card.name
    fill_in "Result No", with: @get_card.result_no
    click_on "Create Get card"

    assert_text "Get card was successfully created"
    click_on "Back"
  end

  test "updating a Get card" do
    visit get_cards_url
    click_on "Edit", match: :first

    fill_in "Card", with: @get_card.card_id
    fill_in "E No", with: @get_card.e_no
    fill_in "Generate No", with: @get_card.generate_no
    fill_in "Get Type", with: @get_card.get_type
    fill_in "Name", with: @get_card.name
    fill_in "Result No", with: @get_card.result_no
    click_on "Update Get card"

    assert_text "Get card was successfully updated"
    click_on "Back"
  end

  test "destroying a Get card" do
    visit get_cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Get card was successfully destroyed"
  end
end
