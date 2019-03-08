require "application_system_test_case"

class UploadedChecksTest < ApplicationSystemTestCase
  setup do
    @uploaded_check = uploaded_checks(:one)
  end

  test "visiting the index" do
    visit uploaded_checks_url
    assert_selector "h1", text: "Uploaded Checks"
  end

  test "creating a Uploaded check" do
    visit uploaded_checks_url
    click_on "New Uploaded Check"

    fill_in "Generate no", with: @uploaded_check.generate_no
    fill_in "Result no", with: @uploaded_check.result_no
    click_on "Create Uploaded check"

    assert_text "Uploaded check was successfully created"
    click_on "Back"
  end

  test "updating a Uploaded check" do
    visit uploaded_checks_url
    click_on "Edit", match: :first

    fill_in "Generate no", with: @uploaded_check.generate_no
    fill_in "Result no", with: @uploaded_check.result_no
    click_on "Update Uploaded check"

    assert_text "Uploaded check was successfully updated"
    click_on "Back"
  end

  test "destroying a Uploaded check" do
    visit uploaded_checks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Uploaded check was successfully destroyed"
  end
end
