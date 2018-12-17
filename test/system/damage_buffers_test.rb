require "application_system_test_case"

class DamageBuffersTest < ApplicationSystemTestCase
  setup do
    @damage_buffer = damage_buffers(:one)
  end

  test "visiting the index" do
    visit damage_buffers_url
    assert_selector "h1", text: "Damage Buffers"
  end

  test "creating a Damage buffer" do
    visit damage_buffers_url
    click_on "New Damage Buffer"

    fill_in "Act", with: @damage_buffer.act_id
    fill_in "Battle page", with: @damage_buffer.battle_page
    fill_in "Buffer", with: @damage_buffer.buffer_id
    fill_in "E no", with: @damage_buffer.e_no
    fill_in "Generate no", with: @damage_buffer.generate_no
    fill_in "Lv", with: @damage_buffer.lv
    fill_in "Result no", with: @damage_buffer.result_no
    fill_in "Value", with: @damage_buffer.value
    click_on "Create Damage buffer"

    assert_text "Damage buffer was successfully created"
    click_on "Back"
  end

  test "updating a Damage buffer" do
    visit damage_buffers_url
    click_on "Edit", match: :first

    fill_in "Act", with: @damage_buffer.act_id
    fill_in "Battle page", with: @damage_buffer.battle_page
    fill_in "Buffer", with: @damage_buffer.buffer_id
    fill_in "E no", with: @damage_buffer.e_no
    fill_in "Generate no", with: @damage_buffer.generate_no
    fill_in "Lv", with: @damage_buffer.lv
    fill_in "Result no", with: @damage_buffer.result_no
    fill_in "Value", with: @damage_buffer.value
    click_on "Update Damage buffer"

    assert_text "Damage buffer was successfully updated"
    click_on "Back"
  end

  test "destroying a Damage buffer" do
    visit damage_buffers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Damage buffer was successfully destroyed"
  end
end
