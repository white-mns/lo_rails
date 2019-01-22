require "application_system_test_case"

class PreTotalPartyNumsTest < ApplicationSystemTestCase
  setup do
    @pre_total_party_num = pre_total_party_nums(:one)
  end

  test "visiting the index" do
    visit pre_total_party_nums_url
    assert_selector "h1", text: "Pre Total Party Nums"
  end

  test "creating a Pre total party num" do
    visit pre_total_party_nums_url
    click_on "New Pre Total Party Num"

    fill_in "Count type", with: @pre_total_party_num.count_type
    fill_in "E no", with: @pre_total_party_num.e_no
    fill_in "Generate no", with: @pre_total_party_num.generate_no
    fill_in "Party num", with: @pre_total_party_num.party_num
    fill_in "Result no", with: @pre_total_party_num.result_no
    click_on "Create Pre total party num"

    assert_text "Pre total party num was successfully created"
    click_on "Back"
  end

  test "updating a Pre total party num" do
    visit pre_total_party_nums_url
    click_on "Edit", match: :first

    fill_in "Count type", with: @pre_total_party_num.count_type
    fill_in "E no", with: @pre_total_party_num.e_no
    fill_in "Generate no", with: @pre_total_party_num.generate_no
    fill_in "Party num", with: @pre_total_party_num.party_num
    fill_in "Result no", with: @pre_total_party_num.result_no
    click_on "Update Pre total party num"

    assert_text "Pre total party num was successfully updated"
    click_on "Back"
  end

  test "destroying a Pre total party num" do
    visit pre_total_party_nums_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pre total party num was successfully destroyed"
  end
end
