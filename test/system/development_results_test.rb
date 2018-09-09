require "application_system_test_case"

class DevelopmentResultsTest < ApplicationSystemTestCase
  setup do
    @development_result = development_results(:one)
  end

  test "visiting the index" do
    visit development_results_url
    assert_selector "h1", text: "Development Results"
  end

  test "creating a Development result" do
    visit development_results_url
    click_on "New Development Result"

    fill_in "Bellicose", with: @development_result.bellicose
    fill_in "Development Result", with: @development_result.development_result
    fill_in "E No", with: @development_result.e_no
    fill_in "Generate No", with: @development_result.generate_no
    fill_in "Party Num", with: @development_result.party_num
    fill_in "Result No", with: @development_result.result_no
    click_on "Create Development result"

    assert_text "Development result was successfully created"
    click_on "Back"
  end

  test "updating a Development result" do
    visit development_results_url
    click_on "Edit", match: :first

    fill_in "Bellicose", with: @development_result.bellicose
    fill_in "Development Result", with: @development_result.development_result
    fill_in "E No", with: @development_result.e_no
    fill_in "Generate No", with: @development_result.generate_no
    fill_in "Party Num", with: @development_result.party_num
    fill_in "Result No", with: @development_result.result_no
    click_on "Update Development result"

    assert_text "Development result was successfully updated"
    click_on "Back"
  end

  test "destroying a Development result" do
    visit development_results_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Development result was successfully destroyed"
  end
end
