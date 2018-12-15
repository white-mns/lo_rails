require "application_system_test_case"

class ParameterDevelopmentsTest < ApplicationSystemTestCase
  setup do
    @parameter_development = parameter_developments(:one)
  end

  test "visiting the index" do
    visit parameter_developments_url
    assert_selector "h1", text: "Parameter Developments"
  end

  test "creating a Parameter development" do
    visit parameter_developments_url
    click_on "New Parameter Development"

    fill_in "Cond", with: @parameter_development.cond
    fill_in "E No", with: @parameter_development.e_no
    fill_in "Generate No", with: @parameter_development.generate_no
    fill_in "Lv", with: @parameter_development.lv
    fill_in "Mfp", with: @parameter_development.mfp
    fill_in "Mlp", with: @parameter_development.mlp
    fill_in "Rank", with: @parameter_development.rank
    fill_in "Result No", with: @parameter_development.result_no
    click_on "Create Parameter development"

    assert_text "Parameter development was successfully created"
    click_on "Back"
  end

  test "updating a Parameter development" do
    visit parameter_developments_url
    click_on "Edit", match: :first

    fill_in "Cond", with: @parameter_development.cond
    fill_in "E No", with: @parameter_development.e_no
    fill_in "Generate No", with: @parameter_development.generate_no
    fill_in "Lv", with: @parameter_development.lv
    fill_in "Mfp", with: @parameter_development.mfp
    fill_in "Mlp", with: @parameter_development.mlp
    fill_in "Rank", with: @parameter_development.rank
    fill_in "Result No", with: @parameter_development.result_no
    click_on "Update Parameter development"

    assert_text "Parameter development was successfully updated"
    click_on "Back"
  end

  test "destroying a Parameter development" do
    visit parameter_developments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parameter development was successfully destroyed"
  end
end
