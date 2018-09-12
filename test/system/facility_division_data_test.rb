require "application_system_test_case"

class FacilityDivisionDataTest < ApplicationSystemTestCase
  setup do
    @facility_division_datum = facility_division_data(:one)
  end

  test "visiting the index" do
    visit facility_division_data_url
    assert_selector "h1", text: "Facility Division Data"
  end

  test "creating a Facility division datum" do
    visit facility_division_data_url
    click_on "New Facility Division Datum"

    fill_in "Detail", with: @facility_division_datum.detail
    fill_in "Division", with: @facility_division_datum.division_id
    fill_in "Major", with: @facility_division_datum.major
    click_on "Create Facility division datum"

    assert_text "Facility division datum was successfully created"
    click_on "Back"
  end

  test "updating a Facility division datum" do
    visit facility_division_data_url
    click_on "Edit", match: :first

    fill_in "Detail", with: @facility_division_datum.detail
    fill_in "Division", with: @facility_division_datum.division_id
    fill_in "Major", with: @facility_division_datum.major
    click_on "Update Facility division datum"

    assert_text "Facility division datum was successfully updated"
    click_on "Back"
  end

  test "destroying a Facility division datum" do
    visit facility_division_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Facility division datum was successfully destroyed"
  end
end
