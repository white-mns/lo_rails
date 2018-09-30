require "application_system_test_case"

class NewItemUsesTest < ApplicationSystemTestCase
  setup do
    @new_item_use = new_item_uses(:one)
  end

  test "visiting the index" do
    visit new_item_uses_url
    assert_selector "h1", text: "New Item Uses"
  end

  test "creating a New item use" do
    visit new_item_uses_url
    click_on "New New Item Use"

    fill_in "Generate No", with: @new_item_use.generate_no
    fill_in "Name", with: @new_item_use.name
    fill_in "Result No", with: @new_item_use.result_no
    click_on "Create New item use"

    assert_text "New item use was successfully created"
    click_on "Back"
  end

  test "updating a New item use" do
    visit new_item_uses_url
    click_on "Edit", match: :first

    fill_in "Generate No", with: @new_item_use.generate_no
    fill_in "Name", with: @new_item_use.name
    fill_in "Result No", with: @new_item_use.result_no
    click_on "Update New item use"

    assert_text "New item use was successfully updated"
    click_on "Back"
  end

  test "destroying a New item use" do
    visit new_item_uses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "New item use was successfully destroyed"
  end
end
