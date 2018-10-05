require "application_system_test_case"

class MeddlingSuccessRatesTest < ApplicationSystemTestCase
  setup do
    @meddling_success_rate = meddling_success_rates(:one)
  end

  test "visiting the index" do
    visit meddling_success_rates_url
    assert_selector "h1", text: "Meddling Success Rates"
  end

  test "creating a Meddling success rate" do
    visit meddling_success_rates_url
    click_on "New Meddling Success Rate"

    fill_in "Card", with: @meddling_success_rate.card_id
    fill_in "Chain", with: @meddling_success_rate.chain
    fill_in "E No", with: @meddling_success_rate.e_no
    fill_in "Generate No", with: @meddling_success_rate.generate_no
    fill_in "Miss", with: @meddling_success_rate.miss
    fill_in "No Apply", with: @meddling_success_rate.no_apply
    fill_in "Rate", with: @meddling_success_rate.rate
    fill_in "Result No", with: @meddling_success_rate.result_no
    fill_in "Success", with: @meddling_success_rate.success
    fill_in "Sum", with: @meddling_success_rate.sum
    click_on "Create Meddling success rate"

    assert_text "Meddling success rate was successfully created"
    click_on "Back"
  end

  test "updating a Meddling success rate" do
    visit meddling_success_rates_url
    click_on "Edit", match: :first

    fill_in "Card", with: @meddling_success_rate.card_id
    fill_in "Chain", with: @meddling_success_rate.chain
    fill_in "E No", with: @meddling_success_rate.e_no
    fill_in "Generate No", with: @meddling_success_rate.generate_no
    fill_in "Miss", with: @meddling_success_rate.miss
    fill_in "No Apply", with: @meddling_success_rate.no_apply
    fill_in "Rate", with: @meddling_success_rate.rate
    fill_in "Result No", with: @meddling_success_rate.result_no
    fill_in "Success", with: @meddling_success_rate.success
    fill_in "Sum", with: @meddling_success_rate.sum
    click_on "Update Meddling success rate"

    assert_text "Meddling success rate was successfully updated"
    click_on "Back"
  end

  test "destroying a Meddling success rate" do
    visit meddling_success_rates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meddling success rate was successfully destroyed"
  end
end
