require "application_system_test_case"

class ParameterControlsTest < ApplicationSystemTestCase
  setup do
    @parameter_control = parameter_controls(:one)
  end

  test "visiting the index" do
    visit parameter_controls_url
    assert_selector "h1", text: "Parameter Controls"
  end

  test "creating a Parameter control" do
    visit parameter_controls_url
    click_on "New Parameter Control"

    fill_in "Cond", with: @parameter_control.cond
    fill_in "Cvp", with: @parameter_control.cvp
    fill_in "Day", with: @parameter_control.day
    fill_in "E No", with: @parameter_control.e_no
    fill_in "Generate No", with: @parameter_control.generate_no
    fill_in "Mod", with: @parameter_control.mod
    fill_in "Pvp", with: @parameter_control.pvp
    fill_in "Result No", with: @parameter_control.result_no
    click_on "Create Parameter control"

    assert_text "Parameter control was successfully created"
    click_on "Back"
  end

  test "updating a Parameter control" do
    visit parameter_controls_url
    click_on "Edit", match: :first

    fill_in "Cond", with: @parameter_control.cond
    fill_in "Cvp", with: @parameter_control.cvp
    fill_in "Day", with: @parameter_control.day
    fill_in "E No", with: @parameter_control.e_no
    fill_in "Generate No", with: @parameter_control.generate_no
    fill_in "Mod", with: @parameter_control.mod
    fill_in "Pvp", with: @parameter_control.pvp
    fill_in "Result No", with: @parameter_control.result_no
    click_on "Update Parameter control"

    assert_text "Parameter control was successfully updated"
    click_on "Back"
  end

  test "destroying a Parameter control" do
    visit parameter_controls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parameter control was successfully destroyed"
  end
end
