require "application_system_test_case"

class DamagesTest < ApplicationSystemTestCase
  setup do
    @damage = damages(:one)
  end

  test "visiting the index" do
    visit damages_url
    assert_selector "h1", text: "Damages"
  end

  test "creating a Damage" do
    visit damages_url
    click_on "New Damage"

    fill_in "Act", with: @damage.act_id
    fill_in "Act Type", with: @damage.act_type
    fill_in "Battle Page", with: @damage.battle_page
    fill_in "Card", with: @damage.card_id
    fill_in "Chain", with: @damage.chain
    fill_in "Damage", with: @damage.damage
    fill_in "E No", with: @damage.e_no
    fill_in "Element", with: @damage.element
    fill_in "Generate No", with: @damage.generate_no
    fill_in "Is Absorb", with: @damage.is_absorb
    fill_in "Is Clean", with: @damage.is_clean
    fill_in "Is Critical", with: @damage.is_critical
    fill_in "Is Vanish", with: @damage.is_vanish
    fill_in "Is Weak", with: @damage.is_weak
    fill_in "Party", with: @damage.party
    fill_in "Result No", with: @damage.result_no
    fill_in "Target E No", with: @damage.target_e_no
    fill_in "Target Party", with: @damage.target_party
    click_on "Create Damage"

    assert_text "Damage was successfully created"
    click_on "Back"
  end

  test "updating a Damage" do
    visit damages_url
    click_on "Edit", match: :first

    fill_in "Act", with: @damage.act_id
    fill_in "Act Type", with: @damage.act_type
    fill_in "Battle Page", with: @damage.battle_page
    fill_in "Card", with: @damage.card_id
    fill_in "Chain", with: @damage.chain
    fill_in "Damage", with: @damage.damage
    fill_in "E No", with: @damage.e_no
    fill_in "Element", with: @damage.element
    fill_in "Generate No", with: @damage.generate_no
    fill_in "Is Absorb", with: @damage.is_absorb
    fill_in "Is Clean", with: @damage.is_clean
    fill_in "Is Critical", with: @damage.is_critical
    fill_in "Is Vanish", with: @damage.is_vanish
    fill_in "Is Weak", with: @damage.is_weak
    fill_in "Party", with: @damage.party
    fill_in "Result No", with: @damage.result_no
    fill_in "Target E No", with: @damage.target_e_no
    fill_in "Target Party", with: @damage.target_party
    click_on "Update Damage"

    assert_text "Damage was successfully updated"
    click_on "Back"
  end

  test "destroying a Damage" do
    visit damages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Damage was successfully destroyed"
  end
end
