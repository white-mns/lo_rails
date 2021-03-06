class GetCardsController < ApplicationController
  include MyUtility
  before_action :set_get_card, only: [:show, :edit, :update, :destroy]

  # GET /get_cards
  def index
    placeholder_set
    param_set
    @count	= GetCard.notnil().includes(:p_name, card_data: :kind_name).search(params[:q]).result.count()
    @all	= GetCard.notnil().includes(:p_name, card_data: :kind_name).search(params[:q]).result
    @search	= GetCard.notnil().includes(:p_name, card_data: :kind_name).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @get_cards	= @search.result.per(50)
  end

  def drop_subjects
    param_set
    params[:q]["get_type_eq_any"]=[2] 
    @all	= GetCard.notnil().includes(:p_name, :subject, [card_data: :kind_name]).search(params[:q]).result
    @count	= GetCard.notnil().includes(:p_name, :subject, [card_data: :kind_name], [speciality: :pgws_name], [training: :training_name]).search(params[:q]).result.count()
    @search	= GetCard.notnil().includes(:p_name, :subject, [card_data: :kind_name], [speciality: :pgws_name], [training: :training_name]).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @get_cards	= @search.result.per(50)
    
    if params["min_0_hidden"] || params["min_0_gray"] then set_open_flg end
  end

  def set_open_flg
    @open = {}
    @subjects.each do |subject, subject_name|
      @open[subject] = @all.maximum("subjects."+subject) ? @all.maximum("subjects."+subject) : 0
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

    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_text_assign(params, "name", "name_form")
    reference_text_assign(params, "card_data_kind_name_name", "kind_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
    reference_number_assign(params, "subject_slash", "slash_form")
    reference_number_assign(params, "subject_thrust", "thrust_form")
    reference_number_assign(params, "subject_stroke", "stroke_form")
    reference_number_assign(params, "subject_shot", "shot_form")
    reference_number_assign(params, "subject_guard", "guard_form")
    reference_number_assign(params, "subject_dance", "dance_form")
    reference_number_assign(params, "subject_theft", "theft_form")
    reference_number_assign(params, "subject_cooking", "cooking_form")
    reference_number_assign(params, "subject_technology", "technology_form")
    reference_number_assign(params, "subject_movement", "movement_form")
    reference_number_assign(params, "subject_chemistry", "chemistry_form")
    reference_number_assign(params, "subject_arithmetic", "arithmetic_form")
    reference_number_assign(params, "subject_fire", "fire_form")
    reference_number_assign(params, "subject_theology", "theology_form")
    reference_number_assign(params, "subject_life", "life_form")
    reference_number_assign(params, "subject_demonology", "demonology_form")
    reference_number_assign(params, "subject_geography", "geography_form")
    reference_number_assign(params, "subject_astronomy", "astronomy_form")
    reference_number_assign(params, "subject_fengshui", "fengshui_form")
    reference_number_assign(params, "subject_psychology", "psychology_form")
    reference_number_assign(params, "subject_music", "music_form")
    reference_number_assign(params, "subject_curse", "curse_form")
    reference_number_assign(params, "subject_illusion", "illusion_form")
    reference_number_assign(params, "subject_trick", "trick_form")

    reference_text_assign(params, "training_training_name_name", "training_form")
    reference_text_assign(params, "speciality_pgws_name_name", "speciality_form")
    
    params[:q]["get_type_eq_any"] ||= []
    if params["is_get_type_failed"] == "on" then params[:q]["get_type_eq_any"].push(0) end
    if params["is_get_type_create"] == "on" then params[:q]["get_type_eq_any"].push(1) end
    if params["is_get_type_drop"]   == "on" then params[:q]["get_type_eq_any"].push(2) end
     
    params[:q]["card_data_kind_name_name_eq_any"] ||= []
    if params["kind_is_dissociation"] == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("解離") end
    if params["kind_is_first"]        == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("先発") end
    if params["kind_is_trap"]         == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("罠") end
    if params["kind_is_automatic"]    == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("自動") end
    if params["kind_is_abnormity"]    == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("異常") end
    if params["kind_is_moribundity"]  == "on" then params[:q]["card_data_kind_name_name_eq_any"].push("瀕死") end

    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @e_no_form = params["e_no_form"]
    @name_form = params["name_form"]
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @get_type_form = params["get_type_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]
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

    @training_form = params["training_form"]
    @speciality_form = params["speciality_form"]
    
    @is_get_type_failed  = params["is_get_type_failed"]
    @is_get_type_create  = params["is_get_type_create"]
    @is_get_type_drop    = params["is_get_type_drop"]
    if params[:q]["get_type_eq_any"].size == 0 then 
        @is_get_type_failed  = "on"
        @is_get_type_create  = "on"
        @is_get_type_drop    = "on"
    end
    
    @min_0_hidden = params["min_0_hidden"]
    @min_0_gray = params["min_0_gray"]

    @kind_is_dissociation = params["kind_is_dissociation"]
    @kind_is_first        = params["kind_is_first"]
    @kind_is_trap         = params["kind_is_trap"]
    @kind_is_automatic    = params["kind_is_automatic"]
    @kind_is_abnormity    = params["kind_is_abnormity"]
    @kind_is_moribundity  = params["kind_is_moribundity"]

    @show_detail_e_no = params["show_detail_e_no"]
    @show_detail_s_no = params["show_detail_s_no"]
    @show_detail_card = params["show_detail_card"]
    @show_detail_training = params["show_detail_training"]

  end

  # GET /get_cards/1
  #def show
  #end

  # GET /get_cards/new
  #def new
  #  @get_card = GetCard.new
  #end

  # GET /get_cards/1/edit
  #def edit
  #end

  # POST /get_cards
  #def create
  #  @get_card = GetCard.new(get_card_params)

  #  if @get_card.save
  #    redirect_to @get_card, notice: 'Get card was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /get_cards/1
  #def update
  #  if @get_card.update(get_card_params)
  #    redirect_to @get_card, notice: 'Get card was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /get_cards/1
  #def destroy
  #  @get_card.destroy
  #  redirect_to get_cards_url, notice: 'Get card was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_get_card
      @get_card = GetCard.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def get_card_params
      params.require(:get_card).permit(:result_no, :generate_no, :e_no, :name, :card_id, :get_type)
    end
end
