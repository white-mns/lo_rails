require "application_system_test_case"

class ProperNamesTest < ApplicationSystemTestCase
  setup do
    @proper_name = proper_names(:one)
  end

  test "visiting the index" do
    visit proper_names_url
    assert_selector "h1", text: "Proper Names"
  end

  test "creating a Proper name" do
    visit proper_names_url
    click_on "New Proper Name"

    fill_in "Name", with: @proper_name.name
    fill_in "Proper", with: @proper_name.proper_id
    click_on "Create Proper name"

    assert_text "Proper name was successfully created"
    click_on "Back"
  end

  test "updating a Proper name" do
    visit proper_names_url
    click_on "Edit", match: :first

    fill_in "Name", with: @proper_name.name
    fill_in "Proper", with: @proper_name.proper_id
    click_on "Update Proper name"

    assert_text "Proper name was successfully updated"
    click_on "Back"
  end

  test "destroying a Proper name" do
    visit proper_names_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Proper name was successfully destroyed"
  end
end
