require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    fill_in "E No", with: @item.e_no
    fill_in "Effect", with: @item.effect
    fill_in "Equip", with: @item.equip
    fill_in "Generate No", with: @item.generate_no
    fill_in "I No", with: @item.i_no
    fill_in "Kind", with: @item.kind
    fill_in "Lv", with: @item.lv
    fill_in "Name", with: @item.name
    fill_in "Potency", with: @item.potency
    fill_in "Potency Str", with: @item.potency_str
    fill_in "Precision", with: @item.precision
    fill_in "Result No", with: @item.result_no
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    fill_in "E No", with: @item.e_no
    fill_in "Effect", with: @item.effect
    fill_in "Equip", with: @item.equip
    fill_in "Generate No", with: @item.generate_no
    fill_in "I No", with: @item.i_no
    fill_in "Kind", with: @item.kind
    fill_in "Lv", with: @item.lv
    fill_in "Name", with: @item.name
    fill_in "Potency", with: @item.potency
    fill_in "Potency Str", with: @item.potency_str
    fill_in "Precision", with: @item.precision
    fill_in "Result No", with: @item.result_no
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
