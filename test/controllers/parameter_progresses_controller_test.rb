require 'test_helper'

class ParameterProgressesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parameter_progress = parameter_progresses(:one)
  end

  test "should get index" do
    get parameter_progresses_url
    assert_response :success
  end

  test "should get new" do
    get new_parameter_progress_url
    assert_response :success
  end

  test "should create parameter_progress" do
    assert_difference('ParameterProgress.count') do
      post parameter_progresses_url, params: { parameter_progress: { build_t: @parameter_progress.build_t, e_no: @parameter_progress.e_no, generate_no: @parameter_progress.generate_no, mark_t: @parameter_progress.mark_t, result_no: @parameter_progress.result_no, tip: @parameter_progress.tip, tip_t: @parameter_progress.tip_t } }
    end

    assert_redirected_to parameter_progress_url(ParameterProgress.last)
  end

  test "should show parameter_progress" do
    get parameter_progress_url(@parameter_progress)
    assert_response :success
  end

  test "should get edit" do
    get edit_parameter_progress_url(@parameter_progress)
    assert_response :success
  end

  test "should update parameter_progress" do
    patch parameter_progress_url(@parameter_progress), params: { parameter_progress: { build_t: @parameter_progress.build_t, e_no: @parameter_progress.e_no, generate_no: @parameter_progress.generate_no, mark_t: @parameter_progress.mark_t, result_no: @parameter_progress.result_no, tip: @parameter_progress.tip, tip_t: @parameter_progress.tip_t } }
    assert_redirected_to parameter_progress_url(@parameter_progress)
  end

  test "should destroy parameter_progress" do
    assert_difference('ParameterProgress.count', -1) do
      delete parameter_progress_url(@parameter_progress)
    end

    assert_redirected_to parameter_progresses_url
  end
end
