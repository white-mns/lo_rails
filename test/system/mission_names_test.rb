require "application_system_test_case"

class MissionNamesTest < ApplicationSystemTestCase
  setup do
    @mission_name = mission_names(:one)
  end

  test "visiting the index" do
    visit mission_names_url
    assert_selector "h1", text: "Mission Names"
  end

  test "creating a Mission name" do
    visit mission_names_url
    click_on "New Mission Name"

    fill_in "Mission", with: @mission_name.mission_id
    fill_in "Name", with: @mission_name.name
    click_on "Create Mission name"

    assert_text "Mission name was successfully created"
    click_on "Back"
  end

  test "updating a Mission name" do
    visit mission_names_url
    click_on "Edit", match: :first

    fill_in "Mission", with: @mission_name.mission_id
    fill_in "Name", with: @mission_name.name
    click_on "Update Mission name"

    assert_text "Mission name was successfully updated"
    click_on "Back"
  end

  test "destroying a Mission name" do
    visit mission_names_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mission name was successfully destroyed"
  end
end
