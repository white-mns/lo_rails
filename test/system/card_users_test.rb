require "application_system_test_case"

class CardUsersTest < ApplicationSystemTestCase
  setup do
    @card_user = card_users(:one)
  end

  test "visiting the index" do
    visit card_users_url
    assert_selector "h1", text: "Card Users"
  end

  test "creating a Card user" do
    visit card_users_url
    click_on "New Card User"

    fill_in "Battle Page", with: @card_user.battle_page
    fill_in "Card", with: @card_user.card_id
    fill_in "Control", with: @card_user.control
    fill_in "E No", with: @card_user.e_no
    fill_in "Generate No", with: @card_user.generate_no
    fill_in "Party", with: @card_user.party
    fill_in "Result No", with: @card_user.result_no
    fill_in "Success", with: @card_user.success
    click_on "Create Card user"

    assert_text "Card user was successfully created"
    click_on "Back"
  end

  test "updating a Card user" do
    visit card_users_url
    click_on "Edit", match: :first

    fill_in "Battle Page", with: @card_user.battle_page
    fill_in "Card", with: @card_user.card_id
    fill_in "Control", with: @card_user.control
    fill_in "E No", with: @card_user.e_no
    fill_in "Generate No", with: @card_user.generate_no
    fill_in "Party", with: @card_user.party
    fill_in "Result No", with: @card_user.result_no
    fill_in "Success", with: @card_user.success
    click_on "Update Card user"

    assert_text "Card user was successfully updated"
    click_on "Back"
  end

  test "destroying a Card user" do
    visit card_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card user was successfully destroyed"
  end
end
