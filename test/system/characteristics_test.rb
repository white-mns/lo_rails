require "application_system_test_case"

class CharacteristicsTest < ApplicationSystemTestCase
  setup do
    @characteristic = characteristics(:one)
  end

  test "visiting the index" do
    visit characteristics_url
    assert_selector "h1", text: "Characteristics"
  end

  test "creating a Characteristic" do
    visit characteristics_url
    click_on "New Characteristic"

    fill_in "E No", with: @characteristic.e_no
    fill_in "Eva", with: @characteristic.eva
    fill_in "Generate No", with: @characteristic.generate_no
    fill_in "Int", with: @characteristic.int
    fill_in "Mnd", with: @characteristic.mnd
    fill_in "Result No", with: @characteristic.result_no
    fill_in "Str", with: @characteristic.str
    fill_in "Tec", with: @characteristic.tec
    fill_in "Vit", with: @characteristic.vit
    click_on "Create Characteristic"

    assert_text "Characteristic was successfully created"
    click_on "Back"
  end

  test "updating a Characteristic" do
    visit characteristics_url
    click_on "Edit", match: :first

    fill_in "E No", with: @characteristic.e_no
    fill_in "Eva", with: @characteristic.eva
    fill_in "Generate No", with: @characteristic.generate_no
    fill_in "Int", with: @characteristic.int
    fill_in "Mnd", with: @characteristic.mnd
    fill_in "Result No", with: @characteristic.result_no
    fill_in "Str", with: @characteristic.str
    fill_in "Tec", with: @characteristic.tec
    fill_in "Vit", with: @characteristic.vit
    click_on "Update Characteristic"

    assert_text "Characteristic was successfully updated"
    click_on "Back"
  end

  test "destroying a Characteristic" do
    visit characteristics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Characteristic was successfully destroyed"
  end
end
