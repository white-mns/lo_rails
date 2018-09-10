require "application_system_test_case"

class CardUsePagesTest < ApplicationSystemTestCase
  setup do
    @card_use_page = card_use_pages(:one)
  end

  test "visiting the index" do
    visit card_use_pages_url
    assert_selector "h1", text: "Card Use Pages"
  end

  test "creating a Card use page" do
    visit card_use_pages_url
    click_on "New Card Use Page"

    fill_in "Battle Page", with: @card_use_page.battle_page
    fill_in "Generate No", with: @card_use_page.generate_no
    fill_in "Party", with: @card_use_page.party
    fill_in "Result No", with: @card_use_page.result_no
    fill_in "Use Cards", with: @card_use_page.use_cards
    click_on "Create Card use page"

    assert_text "Card use page was successfully created"
    click_on "Back"
  end

  test "updating a Card use page" do
    visit card_use_pages_url
    click_on "Edit", match: :first

    fill_in "Battle Page", with: @card_use_page.battle_page
    fill_in "Generate No", with: @card_use_page.generate_no
    fill_in "Party", with: @card_use_page.party
    fill_in "Result No", with: @card_use_page.result_no
    fill_in "Use Cards", with: @card_use_page.use_cards
    click_on "Update Card use page"

    assert_text "Card use page was successfully updated"
    click_on "Back"
  end

  test "destroying a Card use page" do
    visit card_use_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card use page was successfully destroyed"
  end
end
