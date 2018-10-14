require "application_system_test_case"

class ManufacturesTest < ApplicationSystemTestCase
  setup do
    @manufacture = manufactures(:one)
  end

  test "visiting the index" do
    visit manufactures_url
    assert_selector "h1", text: "Manufactures"
  end

  test "creating a Manufacture" do
    visit manufactures_url
    click_on "New Manufacture"

    fill_in "Cost", with: @manufacture.cost
    fill_in "E No", with: @manufacture.e_no
    fill_in "Effect", with: @manufacture.effect
    fill_in "Effect Lv", with: @manufacture.effect_lv
    fill_in "Facility E No", with: @manufacture.facility_e_no
    fill_in "Facility Effect", with: @manufacture.facility_effect
    fill_in "Facility Lv", with: @manufacture.facility_lv
    fill_in "Facility Name", with: @manufacture.facility_name
    fill_in "Generate No", with: @manufacture.generate_no
    fill_in "Item Name", with: @manufacture.item_name
    fill_in "Kind", with: @manufacture.kind
    fill_in "Potency", with: @manufacture.potency
    fill_in "Precision", with: @manufacture.precision
    fill_in "Result No", with: @manufacture.result_no
    fill_in "Total", with: @manufacture.total
    fill_in "Usage", with: @manufacture.usage
    click_on "Create Manufacture"

    assert_text "Manufacture was successfully created"
    click_on "Back"
  end

  test "updating a Manufacture" do
    visit manufactures_url
    click_on "Edit", match: :first

    fill_in "Cost", with: @manufacture.cost
    fill_in "E No", with: @manufacture.e_no
    fill_in "Effect", with: @manufacture.effect
    fill_in "Effect Lv", with: @manufacture.effect_lv
    fill_in "Facility E No", with: @manufacture.facility_e_no
    fill_in "Facility Effect", with: @manufacture.facility_effect
    fill_in "Facility Lv", with: @manufacture.facility_lv
    fill_in "Facility Name", with: @manufacture.facility_name
    fill_in "Generate No", with: @manufacture.generate_no
    fill_in "Item Name", with: @manufacture.item_name
    fill_in "Kind", with: @manufacture.kind
    fill_in "Potency", with: @manufacture.potency
    fill_in "Precision", with: @manufacture.precision
    fill_in "Result No", with: @manufacture.result_no
    fill_in "Total", with: @manufacture.total
    fill_in "Usage", with: @manufacture.usage
    click_on "Update Manufacture"

    assert_text "Manufacture was successfully updated"
    click_on "Back"
  end

  test "destroying a Manufacture" do
    visit manufactures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Manufacture was successfully destroyed"
  end
end
