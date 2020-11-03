class DropMinSubjectsController < ApplicationController
  include MyUtility
  before_action :set_drop_min_subject, only: [:show, :edit, :update, :destroy]

  # GET /drop_min_subjects
  def index
    placeholder_set
    param_set
    @count	= DropMinSubject.notnil().includes(card_data: :kind_name).search(params[:q]).result.count()
    @all	= DropMinSubject.notnil().includes(card_data: :kind_name).search(params[:q]).result
    @search	= DropMinSubject.notnil().includes(card_data: :kind_name).page(params[:page]).search(params[:q])
    @drop_min_subjects	= @search.result.per(50)
    
    if params["min_0_hidden"] || params["min_0_gray"] then set_open_flg end
  end

  def select
    @subjects = ["slash","thrust","stroke","shot","theft","dance","guard","cooking","technology","movement",
		 "magic","theology","life","demonology","psychology","arithmetic","music","chemistry","geography","astronomy"]
    @search	= DropMinSubject.notnil().page(params[:page]).search(params[:q])
  end

  def set_open_flg
    @open = {}
    @subjects.each do |subject, subject_name|
      @open[subject] = @all.maximum(subject.to_sym) ? @all.maximum(subject.to_sym) : 0
    end
  end

  def param_set
    @subjects = [["slash","斬術"], ["thrust","突術"], ["stroke","打術"], ["shot","射撃"], ["guard","護衛"], ["dance","舞踊"], ["theft","盗術"], ["cooking","料理"], ["technology","工芸"], ["movement","機動"], ["chemistry","化学"], ["arithmetic","算術"],
		 ["fire","火術"], ["theology","神術"], ["life","命術"], ["demonology","冥術"], ["geography","地学"], ["astronomy","天文"], ["fengshui","風水"], ["psychology","心理"], ["music","音楽"], ["curse","呪術"], ["illusion","幻術"], ["trick","奇術"]]
    @latest_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
        params["min_0_gray"] = "on"
    end
    
    set_min_1
    set_marked
    
    if params["show_detail_result_no"] != "1" then
        params["result_no_form"] = sprintf('%d',@latest_result)
    end
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_number_assign(params, "slash", "slash_form")
    reference_number_assign(params, "thrust", "thrust_form")
    reference_number_assign(params, "stroke", "stroke_form")
    reference_number_assign(params, "shot", "shot_form")
    reference_number_assign(params, "guard", "guard_form")
    reference_number_assign(params, "dance", "dance_form")
    reference_number_assign(params, "theft", "theft_form")
    reference_number_assign(params, "cooking", "cooking_form")
    reference_number_assign(params, "technology", "technology_form")
    reference_number_assign(params, "movement", "movement_form")
    reference_number_assign(params, "chemistry", "chemistry_form")
    reference_number_assign(params, "arithmetic", "arithmetic_form")
    reference_number_assign(params, "fire", "fire_form")
    reference_number_assign(params, "theology", "theology_form")
    reference_number_assign(params, "life", "life_form")
    reference_number_assign(params, "demonology", "demonology_form")
    reference_number_assign(params, "geography", "geography_form")
    reference_number_assign(params, "astronomy", "astronomy_form")
    reference_number_assign(params, "fengshui", "fengshui_form")
    reference_number_assign(params, "psychology", "psychology_form")
    reference_number_assign(params, "music", "music_form")
    reference_number_assign(params, "curse", "curse_form")
    reference_number_assign(params, "illusion", "illusion_form")
    reference_number_assign(params, "trick", "trick_form")
    reference_text_assign(params, "card_data_kind_name_name", "kind_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
 
    params[:q]["card_data_kind_name_name_eq_any"] ||= []
    if params["kind_is_dissociation"] == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("解離") end
    if params["kind_is_first"]        == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("先発") end
    if params["kind_is_trap"]         == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("罠") end
    if params["kind_is_automatic"]    == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("自動") end
    if params["kind_is_abnormity"]    == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("異常") end
    if params["kind_is_moribundity"]  == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("瀕死") end

    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @card_id_form = params["card_id_form"]
    @slash_form = params["slash_form"]
    @thrust_form = params["thrust_form"]
    @stroke_form = params["stroke_form"]
    @shot_form = params["shot_form"]
    @guard_form = params["guard_form"]
    @dance_form = params["dance_form"]
    @theft_form = params["theft_form"]
    @cooking_form = params["cooking_form"]
    @technology_form = params["technology_form"]
    @movement_form = params["movement_form"]
    @chemistry_form = params["chemistry_form"]
    @arithmetic_form = params["arithmetic_form"]
    @fire_form = params["fire_form"]
    @theology_form = params["theology_form"]
    @life_form = params["life_form"]
    @demonology_form = params["demonology_form"]
    @geography_form = params["geography_form"]
    @astronomy_form = params["astronomy_form"]
    @fengshui_form = params["fengshui_form"]
    @psychology_form = params["psychology_form"]
    @music_form = params["music_form"]
    @curse_form = params["curse_form"]
    @illusion_form = params["illusion_form"]
    @trick_form = params["trick_form"]
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]
    
    @min_0_hidden = params["min_0_hidden"]
    @min_0_gray = params["min_0_gray"]

    @kind_is_dissociation = params["kind_is_dissociation"]
    @kind_is_first        = params["kind_is_first"]
    @kind_is_trap         = params["kind_is_trap"]
    @kind_is_automatic    = params["kind_is_automatic"]
    @kind_is_abnormity    = params["kind_is_abnormity"]
    @kind_is_moribundity  = params["kind_is_moribundity"]

    @show_detail_result_no = params["show_detail_result_no"]
    @show_detail_e_no = params["show_detail_e_no"]
    @show_detail_s_no = params["show_detail_s_no"]
    @show_detail_card = params["show_detail_card"]
  end

  def set_min_1
    # 学科から獲得カードを探すページからの遷移処理

    @subjects.each do |subject, subject_name|
        if params[subject + "_min_1"] then
            params[subject + "_form"] = "1~"   # 選択した学科に最低値を入力
            params[:q][:s] = subject + ' asc'  # 選択した学科でソート
            params["marked_" + subject] = 'on' # 選択した学科を色付けするよう指定
        end

    end

    # 選択した学科以外は必要値を0にして除外
    if params["comb_or"] == 'on'then
        @subjects.each do |subject, subject_name|
            params[subject + "_form"] = params[subject + "_min_1"] ? "" : "0"
        end
    end
    
    # 選択した学科以外は必要値を0にして除外
    if params["comb_and"] == 'on'then
        @subjects.each do |subject, subject_name|
            params[subject + "_form"] = params[subject + "_min_1"] ? params[subject + "_form"] : "0"
        end
    end
  end

  def set_marked
    @marked = {}
    @subjects.each do |subject, subject_name|
        @marked[subject] = params["marked_" + subject] == 'on' ? 'on' : ""
    end
  end

  # GET /drop_min_subjects/1
  #def show
  #end

  # GET /drop_min_subjects/new
  #def new
  #  @drop_min_subject = DropMinSubject.new
  #end

  # GET /drop_min_subjects/1/edit
  #def edit
  #end

  # POST /drop_min_subjects
  #def create
  #  @drop_min_subject = DropMinSubject.new(drop_min_subject_params)

  #  if @drop_min_subject.save
  #    redirect_to @drop_min_subject, notice: 'Drop min subject was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /drop_min_subjects/1
  #def update
  #  if @drop_min_subject.update(drop_min_subject_params)
  #    redirect_to @drop_min_subject, notice: 'Drop min subject was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /drop_min_subjects/1
  #def destroy
  #  @drop_min_subject.destroy
  #  redirect_to drop_min_subjects_url, notice: 'Drop min subject was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drop_min_subject
      @drop_min_subject = DropMinSubject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def drop_min_subject_params
      params.require(:drop_min_subject).permit(:result_no, :generate_no, :card_id, :slash, :thrust, :stroke, :shot, :guard, :dance, :theft, :cooking, :technology, :movement, :chemistry, :arithmetic, :fire, :theology, :life, :demonology, :geography, :astronomy, :fengshui, :psychology, :music, :curse, :illusion, :trick)
    end
end
