require "application_system_test_case"

class ItemUsesTest < ApplicationSystemTestCase
  setup do
    @item_use = item_uses(:one)
  end

  test "visiting the index" do
    visit item_uses_url
    assert_selector "h1", text: "Item Uses"
  end

  test "creating a Item use" do
    visit item_uses_url
    click_on "New Item Use"

    fill_in "E No", with: @item_use.e_no
    fill_in "Generate No", with: @item_use.generate_no
    fill_in "I No", with: @item_use.i_no
    fill_in "Name", with: @item_use.name
    fill_in "Result No", with: @item_use.result_no
    click_on "Create Item use"

    assert_text "Item use was successfully created"
    click_on "Back"
  end

  test "updating a Item use" do
    visit item_uses_url
    click_on "Edit", match: :first

    fill_in "E No", with: @item_use.e_no
    fill_in "Generate No", with: @item_use.generate_no
    fill_in "I No", with: @item_use.i_no
    fill_in "Name", with: @item_use.name
    fill_in "Result No", with: @item_use.result_no
    click_on "Update Item use"

    assert_text "Item use was successfully updated"
    click_on "Back"
  end

  test "destroying a Item use" do
    visit item_uses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item use was successfully destroyed"
  end
end
