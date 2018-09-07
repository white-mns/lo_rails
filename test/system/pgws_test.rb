require "application_system_test_case"

class PgwsTest < ApplicationSystemTestCase
  setup do
    @pgw = pgws(:one)
  end

  test "visiting the index" do
    visit pgws_url
    assert_selector "h1", text: "Pgws"
  end

  test "creating a Pgw" do
    visit pgws_url
    click_on "New Pgw"

    fill_in "E No", with: @pgw.e_no
    fill_in "Generate No", with: @pgw.generate_no
    fill_in "Pgws Name", with: @pgw.pgws_name_id
    fill_in "Pgws Type", with: @pgw.pgws_type
    fill_in "Result No", with: @pgw.result_no
    click_on "Create Pgw"

    assert_text "Pgw was successfully created"
    click_on "Back"
  end

  test "updating a Pgw" do
    visit pgws_url
    click_on "Edit", match: :first

    fill_in "E No", with: @pgw.e_no
    fill_in "Generate No", with: @pgw.generate_no
    fill_in "Pgws Name", with: @pgw.pgws_name_id
    fill_in "Pgws Type", with: @pgw.pgws_type
    fill_in "Result No", with: @pgw.result_no
    click_on "Update Pgw"

    assert_text "Pgw was successfully updated"
    click_on "Back"
  end

  test "destroying a Pgw" do
    visit pgws_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pgw was successfully destroyed"
  end
end
