require 'test_helper'

class ParameterFightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parameter_fight = parameter_fights(:one)
  end

  test "should get index" do
    get parameter_fights_url
    assert_response :success
  end

  test "should get new" do
    get new_parameter_fight_url
    assert_response :success
  end

  test "should create parameter_fight" do
    assert_difference('ParameterFight.count') do
      post parameter_fights_url, params: { parameter_fight: { e_no: @parameter_fight.e_no, exp: @parameter_fight.exp, generate_no: @parameter_fight.generate_no, lv: @parameter_fight.lv, mfp: @parameter_fight.mfp, mlp: @parameter_fight.mlp, next: @parameter_fight.next, rank: @parameter_fight.rank, result_no: @parameter_fight.result_no } }
    end

    assert_redirected_to parameter_fight_url(ParameterFight.last)
  end

  test "should show parameter_fight" do
    get parameter_fight_url(@parameter_fight)
    assert_response :success
  end

  test "should get edit" do
    get edit_parameter_fight_url(@parameter_fight)
    assert_response :success
  end

  test "should update parameter_fight" do
    patch parameter_fight_url(@parameter_fight), params: { parameter_fight: { e_no: @parameter_fight.e_no, exp: @parameter_fight.exp, generate_no: @parameter_fight.generate_no, lv: @parameter_fight.lv, mfp: @parameter_fight.mfp, mlp: @parameter_fight.mlp, next: @parameter_fight.next, rank: @parameter_fight.rank, result_no: @parameter_fight.result_no } }
    assert_redirected_to parameter_fight_url(@parameter_fight)
  end

  test "should destroy parameter_fight" do
    assert_difference('ParameterFight.count', -1) do
      delete parameter_fight_url(@parameter_fight)
    end

    assert_redirected_to parameter_fights_url
  end
end
