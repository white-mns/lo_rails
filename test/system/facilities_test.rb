require "application_system_test_case"

class FacilitiesTest < ApplicationSystemTestCase
  setup do
    @facility = facilities(:one)
  end

  test "visiting the index" do
    visit facilities_url
    assert_selector "h1", text: "Facilities"
  end

  test "creating a Facility" do
    visit facilities_url
    click_on "New Facility"

    fill_in "Detail Division", with: @facility.detail_division
    fill_in "Division", with: @facility.division
    fill_in "E No", with: @facility.e_no
    fill_in "Generate No", with: @facility.generate_no
    fill_in "Holiday", with: @facility.holiday
    fill_in "Lv", with: @facility.lv
    fill_in "Name", with: @facility.name
    fill_in "Period", with: @facility.period
    fill_in "Result No", with: @facility.result_no
    fill_in "Set Col", with: @facility.set_col
    fill_in "Set Lv", with: @facility.set_lv
    fill_in "Value", with: @facility.value
    click_on "Create Facility"

    assert_text "Facility was successfully created"
    click_on "Back"
  end

  test "updating a Facility" do
    visit facilities_url
    click_on "Edit", match: :first

    fill_in "Detail Division", with: @facility.detail_division
    fill_in "Division", with: @facility.division
    fill_in "E No", with: @facility.e_no
    fill_in "Generate No", with: @facility.generate_no
    fill_in "Holiday", with: @facility.holiday
    fill_in "Lv", with: @facility.lv
    fill_in "Name", with: @facility.name
    fill_in "Period", with: @facility.period
    fill_in "Result No", with: @facility.result_no
    fill_in "Set Col", with: @facility.set_col
    fill_in "Set Lv", with: @facility.set_lv
    fill_in "Value", with: @facility.value
    click_on "Update Facility"

    assert_text "Facility was successfully updated"
    click_on "Back"
  end

  test "destroying a Facility" do
    visit facilities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Facility was successfully destroyed"
  end
end
