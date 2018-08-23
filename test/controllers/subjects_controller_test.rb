require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subject = subjects(:one)
  end

  test "should get index" do
    get subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_subject_url
    assert_response :success
  end

  test "should create subject" do
    assert_difference('Subject.count') do
      post subjects_url, params: { subject: { arithmetic: @subject.arithmetic, astronomy: @subject.astronomy, chemistry: @subject.chemistry, cooking: @subject.cooking, curse: @subject.curse, dance: @subject.dance, demonology: @subject.demonology, e_no: @subject.e_no, fengshui: @subject.fengshui, firee: @subject.firee, generate_no: @subject.generate_no, geography: @subject.geography, guard: @subject.guard, illusion: @subject.illusion, life: @subject.life, movement: @subject.movement, music: @subject.music, psychology: @subject.psychology, result_no: @subject.result_no, shot: @subject.shot, slash: @subject.slash, stroke: @subject.stroke, technology: @subject.technology, theft: @subject.theft, theology: @subject.theology, thrust: @subject.thrust, trick: @subject.trick } }
    end

    assert_redirected_to subject_url(Subject.last)
  end

  test "should show subject" do
    get subject_url(@subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_subject_url(@subject)
    assert_response :success
  end

  test "should update subject" do
    patch subject_url(@subject), params: { subject: { arithmetic: @subject.arithmetic, astronomy: @subject.astronomy, chemistry: @subject.chemistry, cooking: @subject.cooking, curse: @subject.curse, dance: @subject.dance, demonology: @subject.demonology, e_no: @subject.e_no, fengshui: @subject.fengshui, firee: @subject.firee, generate_no: @subject.generate_no, geography: @subject.geography, guard: @subject.guard, illusion: @subject.illusion, life: @subject.life, movement: @subject.movement, music: @subject.music, psychology: @subject.psychology, result_no: @subject.result_no, shot: @subject.shot, slash: @subject.slash, stroke: @subject.stroke, technology: @subject.technology, theft: @subject.theft, theology: @subject.theology, thrust: @subject.thrust, trick: @subject.trick } }
    assert_redirected_to subject_url(@subject)
  end

  test "should destroy subject" do
    assert_difference('Subject.count', -1) do
      delete subject_url(@subject)
    end

    assert_redirected_to subjects_url
  end
end
