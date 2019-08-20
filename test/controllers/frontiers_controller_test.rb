require 'test_helper'

class FrontiersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @frontier = frontiers(:one)
  end

  test "should get index" do
    get frontiers_url
    assert_response :success
  end

  test "should get new" do
    get new_frontier_url
    assert_response :success
  end

  test "should create frontier" do
    assert_difference('Frontier.count') do
      post frontiers_url, params: { frontier: { col: @frontier.col, e_no: @frontier.e_no, generate_no: @frontier.generate_no, lv: @frontier.lv, result_no: @frontier.result_no } }
    end

    assert_redirected_to frontier_url(Frontier.last)
  end

  test "should show frontier" do
    get frontier_url(@frontier)
    assert_response :success
  end

  test "should get edit" do
    get edit_frontier_url(@frontier)
    assert_response :success
  end

  test "should update frontier" do
    patch frontier_url(@frontier), params: { frontier: { col: @frontier.col, e_no: @frontier.e_no, generate_no: @frontier.generate_no, lv: @frontier.lv, result_no: @frontier.result_no } }
    assert_redirected_to frontier_url(@frontier)
  end

  test "should destroy frontier" do
    assert_difference('Frontier.count', -1) do
      delete frontier_url(@frontier)
    end

    assert_redirected_to frontiers_url
  end
end
