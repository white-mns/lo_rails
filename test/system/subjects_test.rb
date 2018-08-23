require "application_system_test_case"

class SubjectsTest < ApplicationSystemTestCase
  setup do
    @subject = subjects(:one)
  end

  test "visiting the index" do
    visit subjects_url
    assert_selector "h1", text: "Subjects"
  end

  test "creating a Subject" do
    visit subjects_url
    click_on "New Subject"

    fill_in "Arithmetic", with: @subject.arithmetic
    fill_in "Astronomy", with: @subject.astronomy
    fill_in "Chemistry", with: @subject.chemistry
    fill_in "Cooking", with: @subject.cooking
    fill_in "Curse", with: @subject.curse
    fill_in "Dance", with: @subject.dance
    fill_in "Demonology", with: @subject.demonology
    fill_in "E No", with: @subject.e_no
    fill_in "Fengshui", with: @subject.fengshui
    fill_in "Firee", with: @subject.firee
    fill_in "Generate No", with: @subject.generate_no
    fill_in "Geography", with: @subject.geography
    fill_in "Guard", with: @subject.guard
    fill_in "Illusion", with: @subject.illusion
    fill_in "Life", with: @subject.life
    fill_in "Movement", with: @subject.movement
    fill_in "Music", with: @subject.music
    fill_in "Psychology", with: @subject.psychology
    fill_in "Result No", with: @subject.result_no
    fill_in "Shot", with: @subject.shot
    fill_in "Slash", with: @subject.slash
    fill_in "Stroke", with: @subject.stroke
    fill_in "Technology", with: @subject.technology
    fill_in "Theft", with: @subject.theft
    fill_in "Theology", with: @subject.theology
    fill_in "Thrust", with: @subject.thrust
    fill_in "Trick", with: @subject.trick
    click_on "Create Subject"

    assert_text "Subject was successfully created"
    click_on "Back"
  end

  test "updating a Subject" do
    visit subjects_url
    click_on "Edit", match: :first

    fill_in "Arithmetic", with: @subject.arithmetic
    fill_in "Astronomy", with: @subject.astronomy
    fill_in "Chemistry", with: @subject.chemistry
    fill_in "Cooking", with: @subject.cooking
    fill_in "Curse", with: @subject.curse
    fill_in "Dance", with: @subject.dance
    fill_in "Demonology", with: @subject.demonology
    fill_in "E No", with: @subject.e_no
    fill_in "Fengshui", with: @subject.fengshui
    fill_in "Firee", with: @subject.firee
    fill_in "Generate No", with: @subject.generate_no
    fill_in "Geography", with: @subject.geography
    fill_in "Guard", with: @subject.guard
    fill_in "Illusion", with: @subject.illusion
    fill_in "Life", with: @subject.life
    fill_in "Movement", with: @subject.movement
    fill_in "Music", with: @subject.music
    fill_in "Psychology", with: @subject.psychology
    fill_in "Result No", with: @subject.result_no
    fill_in "Shot", with: @subject.shot
    fill_in "Slash", with: @subject.slash
    fill_in "Stroke", with: @subject.stroke
    fill_in "Technology", with: @subject.technology
    fill_in "Theft", with: @subject.theft
    fill_in "Theology", with: @subject.theology
    fill_in "Thrust", with: @subject.thrust
    fill_in "Trick", with: @subject.trick
    click_on "Update Subject"

    assert_text "Subject was successfully updated"
    click_on "Back"
  end

  test "destroying a Subject" do
    visit subjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subject was successfully destroyed"
  end
end
