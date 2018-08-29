require 'test_helper'

class DropMinSubjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @drop_min_subject = drop_min_subjects(:one)
  end

  test "should get index" do
    get drop_min_subjects_url
    assert_response :success
  end

  test "should get new" do
    get new_drop_min_subject_url
    assert_response :success
  end

  test "should create drop_min_subject" do
    assert_difference('DropMinSubject.count') do
      post drop_min_subjects_url, params: { drop_min_subject: { arithmetic: @drop_min_subject.arithmetic, astronomy: @drop_min_subject.astronomy, card_id: @drop_min_subject.card_id, chemistry: @drop_min_subject.chemistry, cooking: @drop_min_subject.cooking, curse: @drop_min_subject.curse, dance: @drop_min_subject.dance, demonology: @drop_min_subject.demonology, fengshui: @drop_min_subject.fengshui, fire: @drop_min_subject.fire, generate_no: @drop_min_subject.generate_no, geography: @drop_min_subject.geography, guard: @drop_min_subject.guard, illusion: @drop_min_subject.illusion, life: @drop_min_subject.life, movement: @drop_min_subject.movement, music: @drop_min_subject.music, psychology: @drop_min_subject.psychology, result_no: @drop_min_subject.result_no, shot: @drop_min_subject.shot, slash: @drop_min_subject.slash, stroke: @drop_min_subject.stroke, technology: @drop_min_subject.technology, theft: @drop_min_subject.theft, theology: @drop_min_subject.theology, thrust: @drop_min_subject.thrust, trick: @drop_min_subject.trick } }
    end

    assert_redirected_to drop_min_subject_url(DropMinSubject.last)
  end

  test "should show drop_min_subject" do
    get drop_min_subject_url(@drop_min_subject)
    assert_response :success
  end

  test "should get edit" do
    get edit_drop_min_subject_url(@drop_min_subject)
    assert_response :success
  end

  test "should update drop_min_subject" do
    patch drop_min_subject_url(@drop_min_subject), params: { drop_min_subject: { arithmetic: @drop_min_subject.arithmetic, astronomy: @drop_min_subject.astronomy, card_id: @drop_min_subject.card_id, chemistry: @drop_min_subject.chemistry, cooking: @drop_min_subject.cooking, curse: @drop_min_subject.curse, dance: @drop_min_subject.dance, demonology: @drop_min_subject.demonology, fengshui: @drop_min_subject.fengshui, fire: @drop_min_subject.fire, generate_no: @drop_min_subject.generate_no, geography: @drop_min_subject.geography, guard: @drop_min_subject.guard, illusion: @drop_min_subject.illusion, life: @drop_min_subject.life, movement: @drop_min_subject.movement, music: @drop_min_subject.music, psychology: @drop_min_subject.psychology, result_no: @drop_min_subject.result_no, shot: @drop_min_subject.shot, slash: @drop_min_subject.slash, stroke: @drop_min_subject.stroke, technology: @drop_min_subject.technology, theft: @drop_min_subject.theft, theology: @drop_min_subject.theology, thrust: @drop_min_subject.thrust, trick: @drop_min_subject.trick } }
    assert_redirected_to drop_min_subject_url(@drop_min_subject)
  end

  test "should destroy drop_min_subject" do
    assert_difference('DropMinSubject.count', -1) do
      delete drop_min_subject_url(@drop_min_subject)
    end

    assert_redirected_to drop_min_subjects_url
  end
end
