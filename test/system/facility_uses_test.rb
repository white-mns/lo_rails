require "application_system_test_case"

class FacilityUsesTest < ApplicationSystemTestCase
  setup do
    @facility_use = facility_uses(:one)
  end

  test "visiting the index" do
    visit facility_uses_url
    assert_selector "h1", text: "Facility Uses"
  end

  test "creating a Facility use" do
    visit facility_uses_url
    click_on "New Facility Use"

    fill_in "Cost", with: @facility_use.cost
    fill_in "E No", with: @facility_use.e_no
    fill_in "Facility E No", with: @facility_use.facility_e_no
    fill_in "Facility Effect", with: @facility_use.facility_effect
    fill_in "Facility Lv", with: @facility_use.facility_lv
    fill_in "Facility Name", with: @facility_use.facility_name
    fill_in "Generate No", with: @facility_use.generate_no
    fill_in "Result No", with: @facility_use.result_no
    fill_in "Success", with: @facility_use.success
    fill_in "Usage", with: @facility_use.usage
    click_on "Create Facility use"

    assert_text "Facility use was successfully created"
    click_on "Back"
  end

  test "updating a Facility use" do
    visit facility_uses_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @facility_use.cost
    fill_in "E No", with: @facility_use.e_no
    fill_in "Facility E No", with: @facility_use.facility_e_no
    fill_in "Facility Effect", with: @facility_use.facility_effect
    fill_in "Facility Lv", with: @facility_use.facility_lv
    fill_in "Facility Name", with: @facility_use.facility_name
    fill_in "Generate No", with: @facility_use.generate_no
    fill_in "Result No", with: @facility_use.result_no
    fill_in "Success", with: @facility_use.success
    fill_in "Usage", with: @facility_use.usage
    click_on "Update Facility use"

    assert_text "Facility use was successfully updated"
    click_on "Back"
  end

  test "destroying a Facility use" do
    visit facility_uses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Facility use was successfully destroyed"
  end
end
