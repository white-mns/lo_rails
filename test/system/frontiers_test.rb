require "application_system_test_case"

class FrontiersTest < ApplicationSystemTestCase
  setup do
    @frontier = frontiers(:one)
  end

  test "visiting the index" do
    visit frontiers_url
    assert_selector "h1", text: "Frontiers"
  end

  test "creating a Frontier" do
    visit frontiers_url
    click_on "New Frontier"

    fill_in "Col", with: @frontier.col
    fill_in "E no", with: @frontier.e_no
    fill_in "Generate no", with: @frontier.generate_no
    fill_in "Lv", with: @frontier.lv
    fill_in "Result no", with: @frontier.result_no
    click_on "Create Frontier"

    assert_text "Frontier was successfully created"
    click_on "Back"
  end

  test "updating a Frontier" do
    visit frontiers_url
    click_on "Edit", match: :first

    fill_in "Col", with: @frontier.col
    fill_in "E no", with: @frontier.e_no
    fill_in "Generate no", with: @frontier.generate_no
    fill_in "Lv", with: @frontier.lv
    fill_in "Result no", with: @frontier.result_no
    click_on "Update Frontier"

    assert_text "Frontier was successfully updated"
    click_on "Back"
  end

  test "destroying a Frontier" do
    visit frontiers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Frontier was successfully destroyed"
  end
end
