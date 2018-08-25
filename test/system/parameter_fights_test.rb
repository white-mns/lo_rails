require "application_system_test_case"

class ParameterFightsTest < ApplicationSystemTestCase
  setup do
    @parameter_fight = parameter_fights(:one)
  end

  test "visiting the index" do
    visit parameter_fights_url
    assert_selector "h1", text: "Parameter Fights"
  end

  test "creating a Parameter fight" do
    visit parameter_fights_url
    click_on "New Parameter Fight"

    fill_in "E No", with: @parameter_fight.e_no
    fill_in "Exp", with: @parameter_fight.exp
    fill_in "Generate No", with: @parameter_fight.generate_no
    fill_in "Lv", with: @parameter_fight.lv
    fill_in "Mfp", with: @parameter_fight.mfp
    fill_in "Mlp", with: @parameter_fight.mlp
    fill_in "Next", with: @parameter_fight.next
    fill_in "Rank", with: @parameter_fight.rank
    fill_in "Result No", with: @parameter_fight.result_no
    click_on "Create Parameter fight"

    assert_text "Parameter fight was successfully created"
    click_on "Back"
  end

  test "updating a Parameter fight" do
    visit parameter_fights_url
    click_on "Edit", match: :first

    fill_in "E No", with: @parameter_fight.e_no
    fill_in "Exp", with: @parameter_fight.exp
    fill_in "Generate No", with: @parameter_fight.generate_no
    fill_in "Lv", with: @parameter_fight.lv
    fill_in "Mfp", with: @parameter_fight.mfp
    fill_in "Mlp", with: @parameter_fight.mlp
    fill_in "Next", with: @parameter_fight.next
    fill_in "Rank", with: @parameter_fight.rank
    fill_in "Result No", with: @parameter_fight.result_no
    click_on "Update Parameter fight"

    assert_text "Parameter fight was successfully updated"
    click_on "Back"
  end

  test "destroying a Parameter fight" do
    visit parameter_fights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Parameter fight was successfully destroyed"
  end
end
