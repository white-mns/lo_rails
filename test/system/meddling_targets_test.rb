require "application_system_test_case"

class MeddlingTargetsTest < ApplicationSystemTestCase
  setup do
    @meddling_target = meddling_targets(:one)
  end

  test "visiting the index" do
    visit meddling_targets_url
    assert_selector "h1", text: "Meddling Targets"
  end

  test "creating a Meddling target" do
    visit meddling_targets_url
    click_on "New Meddling Target"

    fill_in "Card", with: @meddling_target.card_id
    fill_in "Chain", with: @meddling_target.chain
    fill_in "Count", with: @meddling_target.count
    fill_in "E No", with: @meddling_target.e_no
    fill_in "Generate No", with: @meddling_target.generate_no
    fill_in "Result No", with: @meddling_target.result_no
    fill_in "Target", with: @meddling_target.target_id
    click_on "Create Meddling target"

    assert_text "Meddling target was successfully created"
    click_on "Back"
  end

  test "updating a Meddling target" do
    visit meddling_targets_url
    click_on "Edit", match: :first

    fill_in "Card", with: @meddling_target.card_id
    fill_in "Chain", with: @meddling_target.chain
    fill_in "Count", with: @meddling_target.count
    fill_in "E No", with: @meddling_target.e_no
    fill_in "Generate No", with: @meddling_target.generate_no
    fill_in "Result No", with: @meddling_target.result_no
    fill_in "Target", with: @meddling_target.target_id
    click_on "Update Meddling target"

    assert_text "Meddling target was successfully updated"
    click_on "Back"
  end

  test "destroying a Meddling target" do
    visit meddling_targets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meddling target was successfully destroyed"
  end
end
