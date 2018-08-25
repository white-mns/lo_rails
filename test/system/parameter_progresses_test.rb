require "application_system_test_case"

class ParameterProgressesTest < ApplicationSystemTestCase
  setup do
    @parameter_progress = parameter_progresses(:one)
  end

  test "visiting the index" do
    visit parameter_progresses_url
    assert_selector "h1", text: "Parameter Progresses"
  end

  test "creating a Parameter progress" do
    visit parameter_progresses_url
    click_on "New Parameter Progress"

    fill_in "Build T", with: @parameter_progress.build_t
    fill_in "E No", with: @parameter_progress.e_no
    fill_in "Generate No", with: @parameter_progress.generate_no
    fill_in "Mark T", with: @parameter_progress.mark_t
    fill_in "Result No", with: @parameter_progress.result_no
    fill_in "Tip", with: @parameter_progress.tip
    fill_in "Tip T", with: @parameter_progress.tip_t
    click_on "Create Parameter progress"

    assert_text "Parameter progress was successfully created"
    click_on "Back"
  end

  test "updating a Parameter progress" do
    visit parameter_progresses_url
    click_on "Edit", match: :first

    fill_in "Build T", with: @parameter_progress.build_t
    fill_in "E No", with: @parameter_progress.e_no
    fill_in "Generate No", with: @parameter_progress.generate_no
    fill_in "Mark T", with: @parameter_progress.mark_t
    fill_in "Result No", with: @parameter_progress.result_no
    fill_in "Tip", with: @parameter_progress.tip
    fill_in "Tip T", with: @parameter_progress.tip_t
    click_on "Update Parameter progress"

    assert_text "Parameter progress was successfully updated"
    click_on "Back"
  end

  test "destroying a Parameter progress" do
    visit parameter_progresses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parameter progress was successfully destroyed"
  end
end
