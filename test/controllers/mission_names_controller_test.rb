require 'test_helper'

class MissionNamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mission_name = mission_names(:one)
  end

  test "should get index" do
    get mission_names_url
    assert_response :success
  end

  test "should get new" do
    get new_mission_name_url
    assert_response :success
  end

  test "should create mission_name" do
    assert_difference('MissionName.count') do
      post mission_names_url, params: { mission_name: { mission_id: @mission_name.mission_id, name: @mission_name.name } }
    end

    assert_redirected_to mission_name_url(MissionName.last)
  end

  test "should show mission_name" do
    get mission_name_url(@mission_name)
    assert_response :success
  end

  test "should get edit" do
    get edit_mission_name_url(@mission_name)
    assert_response :success
  end

  test "should update mission_name" do
    patch mission_name_url(@mission_name), params: { mission_name: { mission_id: @mission_name.mission_id, name: @mission_name.name } }
    assert_redirected_to mission_name_url(@mission_name)
  end

  test "should destroy mission_name" do
    assert_difference('MissionName.count', -1) do
      delete mission_name_url(@mission_name)
    end

    assert_redirected_to mission_names_url
  end
end
