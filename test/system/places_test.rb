require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  setup do
    @place = places(:one)
  end

  test "visiting the index" do
    visit places_url
    assert_selector "h1", text: "Places"
  end

  test "creating a Place" do
    visit places_url
    click_on "New Place"

    fill_in "E No", with: @place.e_no
    fill_in "Generate No", with: @place.generate_no
    fill_in "Invation Col", with: @place.invation_col
    fill_in "Invation Lv", with: @place.invation_lv
    fill_in "Result No", with: @place.result_no
    fill_in "Return Col", with: @place.return_col
    fill_in "Return Lv", with: @place.return_lv
    click_on "Create Place"

    assert_text "Place was successfully created"
    click_on "Back"
  end

  test "updating a Place" do
    visit places_url
    click_on "Edit", match: :first

    fill_in "E No", with: @place.e_no
    fill_in "Generate No", with: @place.generate_no
    fill_in "Invation Col", with: @place.invation_col
    fill_in "Invation Lv", with: @place.invation_lv
    fill_in "Result No", with: @place.result_no
    fill_in "Return Col", with: @place.return_col
    fill_in "Return Lv", with: @place.return_lv
    click_on "Update Place"

    assert_text "Place was successfully updated"
    click_on "Back"
  end

  test "destroying a Place" do
    visit places_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place was successfully destroyed"
  end
end
