require "application_system_test_case"

class MaxChainsTest < ApplicationSystemTestCase
  setup do
    @max_chain = max_chains(:one)
  end

  test "visiting the index" do
    visit max_chains_url
    assert_selector "h1", text: "Max Chains"
  end

  test "creating a Max chain" do
    visit max_chains_url
    click_on "New Max Chain"

    fill_in "Battle Page", with: @max_chain.battle_page
    fill_in "Generate No", with: @max_chain.generate_no
    fill_in "Max Chain", with: @max_chain.max_chain
    fill_in "Party", with: @max_chain.party
    fill_in "Result No", with: @max_chain.result_no
    click_on "Create Max chain"

    assert_text "Max chain was successfully created"
    click_on "Back"
  end

  test "updating a Max chain" do
    visit max_chains_url
    click_on "Edit", match: :first

    fill_in "Battle Page", with: @max_chain.battle_page
    fill_in "Generate No", with: @max_chain.generate_no
    fill_in "Max Chain", with: @max_chain.max_chain
    fill_in "Party", with: @max_chain.party
    fill_in "Result No", with: @max_chain.result_no
    click_on "Update Max chain"

    assert_text "Max chain was successfully updated"
    click_on "Back"
  end

  test "destroying a Max chain" do
    visit max_chains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Max chain was successfully destroyed"
  end
end
