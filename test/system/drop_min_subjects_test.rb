require "application_system_test_case"

class DropMinSubjectsTest < ApplicationSystemTestCase
  setup do
    @drop_min_subject = drop_min_subjects(:one)
  end

  test "visiting the index" do
    visit drop_min_subjects_url
    assert_selector "h1", text: "Drop Min Subjects"
  end

  test "creating a Drop min subject" do
    visit drop_min_subjects_url
    click_on "New Drop Min Subject"

    fill_in "Arithmetic", with: @drop_min_subject.arithmetic
    fill_in "Astronomy", with: @drop_min_subject.astronomy
    fill_in "Card", with: @drop_min_subject.card_id
    fill_in "Chemistry", with: @drop_min_subject.chemistry
    fill_in "Cooking", with: @drop_min_subject.cooking
    fill_in "Curse", with: @drop_min_subject.curse
    fill_in "Dance", with: @drop_min_subject.dance
    fill_in "Demonology", with: @drop_min_subject.demonology
    fill_in "Fengshui", with: @drop_min_subject.fengshui
    fill_in "Fire", with: @drop_min_subject.fire
    fill_in "Generate No", with: @drop_min_subject.generate_no
    fill_in "Geography", with: @drop_min_subject.geography
    fill_in "Guard", with: @drop_min_subject.guard
    fill_in "Illusion", with: @drop_min_subject.illusion
    fill_in "Life", with: @drop_min_subject.life
    fill_in "Movement", with: @drop_min_subject.movement
    fill_in "Music", with: @drop_min_subject.music
    fill_in "Psychology", with: @drop_min_subject.psychology
    fill_in "Result No", with: @drop_min_subject.result_no
    fill_in "Shot", with: @drop_min_subject.shot
    fill_in "Slash", with: @drop_min_subject.slash
    fill_in "Stroke", with: @drop_min_subject.stroke
    fill_in "Technology", with: @drop_min_subject.technology
    fill_in "Theft", with: @drop_min_subject.theft
    fill_in "Theology", with: @drop_min_subject.theology
    fill_in "Thrust", with: @drop_min_subject.thrust
    fill_in "Trick", with: @drop_min_subject.trick
    click_on "Create Drop min subject"

    assert_text "Drop min subject was successfully created"
    click_on "Back"
  end

  test "updating a Drop min subject" do
    visit drop_min_subjects_url
    click_on "Edit", match: :first

    fill_in "Arithmetic", with: @drop_min_subject.arithmetic
    fill_in "Astronomy", with: @drop_min_subject.astronomy
    fill_in "Card", with: @drop_min_subject.card_id
    fill_in "Chemistry", with: @drop_min_subject.chemistry
    fill_in "Cooking", with: @drop_min_subject.cooking
    fill_in "Curse", with: @drop_min_subject.curse
    fill_in "Dance", with: @drop_min_subject.dance
    fill_in "Demonology", with: @drop_min_subject.demonology
    fill_in "Fengshui", with: @drop_min_subject.fengshui
    fill_in "Fire", with: @drop_min_subject.fire
    fill_in "Generate No", with: @drop_min_subject.generate_no
    fill_in "Geography", with: @drop_min_subject.geography
    fill_in "Guard", with: @drop_min_subject.guard
    fill_in "Illusion", with: @drop_min_subject.illusion
    fill_in "Life", with: @drop_min_subject.life
    fill_in "Movement", with: @drop_min_subject.movement
    fill_in "Music", with: @drop_min_subject.music
    fill_in "Psychology", with: @drop_min_subject.psychology
    fill_in "Result No", with: @drop_min_subject.result_no
    fill_in "Shot", with: @drop_min_subject.shot
    fill_in "Slash", with: @drop_min_subject.slash
    fill_in "Stroke", with: @drop_min_subject.stroke
    fill_in "Technology", with: @drop_min_subject.technology
    fill_in "Theft", with: @drop_min_subject.theft
    fill_in "Theology", with: @drop_min_subject.theology
    fill_in "Thrust", with: @drop_min_subject.thrust
    fill_in "Trick", with: @drop_min_subject.trick
    click_on "Update Drop min subject"

    assert_text "Drop min subject was successfully updated"
    click_on "Back"
  end

  test "destroying a Drop min subject" do
    visit drop_min_subjects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Drop min subject was successfully destroyed"
  end
end
