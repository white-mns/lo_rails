require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test "visiting the index" do
    visit cards_url
    assert_selector "h1", text: "Cards"
  end

  test "creating a Card" do
    visit cards_url
    click_on "New Card"

    fill_in "Card", with: @card.card_id
    fill_in "E No", with: @card.e_no
    fill_in "Generate No", with: @card.generate_no
    fill_in "Kind", with: @card.kind
    fill_in "Name", with: @card.name
    fill_in "Possession", with: @card.possession
    fill_in "Result No", with: @card.result_no
    fill_in "S No", with: @card.s_no
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "updating a Card" do
    visit cards_url
    click_on "Edit", match: :first

    fill_in "Card", with: @card.card_id
    fill_in "E No", with: @card.e_no
    fill_in "Generate No", with: @card.generate_no
    fill_in "Kind", with: @card.kind
    fill_in "Name", with: @card.name
    fill_in "Possession", with: @card.possession
    fill_in "Result No", with: @card.result_no
    fill_in "S No", with: @card.s_no
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "destroying a Card" do
    visit cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card was successfully destroyed"
  end
end
