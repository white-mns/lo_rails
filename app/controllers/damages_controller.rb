class DamagesController < ApplicationController
  include MyUtility
  before_action :set_damage, only: [:show, :edit, :update, :destroy]

  # GET /damages
  def index
    param_set
    @count	= Damage.notnil().includes(:p_name, :target_p_name, :act_type_name, [card_data: :kind_name], :characteristic, :target_characteristic, :party_data, :target_party_data, :parameter_development, :target_parameter_development).search(params[:q]).result.count()
    @search	= Damage.notnil().includes(:p_name, :target_p_name, :act_type_name, [card_data: :kind_name], :characteristic, :target_characteristic, :party_data, :target_party_data, :parameter_development, :target_parameter_development).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @damages	= @search.result.per(50)
  end

  def param_set
    @last_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@last_result)
    end
    
    reference_text_assign(params, "p_name_name", "p_name_form")
    reference_text_assign(params, "target_p_name_name", "target_p_name_form")
    reference_number_assign(params, "result_no", "result_no_form")
    reference_number_assign(params, "generate_no", "generate_no_form")
    reference_number_assign(params, "battle_page", "battle_page_form")
    reference_number_assign(params, "e_no", "e_no_form")
    reference_number_assign(params, "card_id", "card_id_form")
    reference_number_assign(params, "chain", "chain_form")
    reference_number_assign(params, "target_e_no", "target_e_no_form")
    reference_text_assign(params, "act_type_name_name", "act_type_form")
    reference_number_assign(params, "element", "element_form")
    reference_number_assign(params, "damage", "damage_form")

    reference_text_assign(params, "card_data_kind_name_name", "kind_form")
    reference_text_assign(params, "card_data_name", "effect_form")
    reference_number_assign(params, "card_data_lv", "lv_form")
    reference_number_assign(params, "card_data_lp", "lp_form")
    reference_number_assign(params, "card_data_fp", "fp_form")
    reference_number_assign(params, "card_data_lpfp", "lp_fp_form")
    
    reference_number_assign(params, "parameter_development_rank", "rank_form")

    reference_number_assign(params, "characteristic_str", "str_form")
    reference_number_assign(params, "characteristic_vit", "vit_form")
    reference_number_assign(params, "characteristic_int", "int_form")
    reference_number_assign(params, "characteristic_mnd", "mnd_form")
    reference_number_assign(params, "characteristic_tec", "tec_form")
    reference_number_assign(params, "characteristic_eva", "eva_form")
    
    reference_number_assign(params, "target_parameter_development_rank", "target_rank_form")

    reference_number_assign(params, "target_characteristic_str", "target_str_form")
    reference_number_assign(params, "target_characteristic_vit", "target_vit_form")
    reference_number_assign(params, "target_characteristic_int", "target_int_form")
    reference_number_assign(params, "target_characteristic_mnd", "target_mnd_form")
    reference_number_assign(params, "target_characteristic_tec", "target_tec_form")
    reference_number_assign(params, "target_characteristic_eva", "target_eva_form")
    
    reference_number_assign(params, "party_data_party_num", "party_num_form")
    reference_number_assign(params, "target_party_data_party_num", "target_party_num_form")
    
    params[:q]["act_type_name_name_cont_any"] ||= []
    if !params["is_form"] then
        params["act_type_damage"]    = "on"
        params["act_type_fp_damage"] = "on"
        params["act_type_lp_heal"]   = "on"
        params["act_type_fp_heal"]   = "on"
    end
    if params["act_type_damage"]     == "on" then params[:q]["act_type_name_name_cont_any"].push("ダメージ") end
    if params["act_type_fp_damage"]  == "on" then params[:q]["act_type_name_name_cont_any"].push("FPダメージ") end
    if params["act_type_lp_heal"]    == "on" then params[:q]["act_type_name_name_cont_any"].push("LP回復") end
    if params["act_type_fp_heal"]    == "on" then params[:q]["act_type_name_name_cont_any"].push("FP回復") end
    
    if params["is_weak"]     == "on" then params[:q]["is_weak_eq"]     = 1 end
    if params["is_critical"] == "on" then params[:q]["is_critical_eq"] = 1 end
    if params["is_clean"]    == "on" then params[:q]["is_clean_eq"]    = 1 end
    if params["is_vanish"]   == "on" then params[:q]["is_vanish_eq"]   = 1 end
    if params["is_absorb"]   == "on" then params[:q]["is_absorb_eq"]   = 1 end
    
    if params["no_weak"]     == "on" then params[:q]["is_weak_eq"]     = 0 end
    if params["no_critical"] == "on" then params[:q]["is_critical_eq"] = 0 end
    if params["no_clean"]    == "on" then params[:q]["is_clean_eq"]    = 0 end
    if params["no_vanish"]   == "on" then params[:q]["is_vanish_eq"]   = 0 end
    if params["no_absorb"]   == "on" then params[:q]["is_absorb_eq"]   = 0 end
    
    @p_name_form = params["p_name_form"]
    @result_no_form = params["result_no_form"]
    @generate_no_form = params["generate_no_form"]
    @battle_page_form = params["battle_page_form"]
    @e_no_form = params["e_no_form"]
    @card_id_form = params["card_id_form"]
    @chain_form = params["chain_form"]
    @target_e_no_form = params["target_e_no_form"]
    @act_type_form = params["act_type_form"]
    @element_form = params["element_form"]
    @damage_form = params["damage_form"]

    @possession_form = params["possession_form"]
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]
    @lpfp_form = params["lpfp_form"]

    @act_type_damage    = params["act_type_damage"]
    @act_type_fp_damage = params["act_type_fp_damage"]
    @act_type_lp_heal   = params["act_type_lp_heal"]
    @act_type_fp_heal   = params["act_type_fp_heal"]
    
    @is_weak = params["is_weak"]
    @is_critical = params["is_critical"]
    @is_clean = params["is_clean"]
    @is_vanish = params["is_vanish"]
    @is_absorb = params["is_absorb"]
    
    @no_weak = params["no_weak"]
    @no_critical = params["no_critical"]
    @no_clean = params["no_clean"]
    @no_vanish = params["no_vanish"]
    @no_absorb = params["no_absorb"]
    
    @rank_form = params["rank_form"]

    @str_form = params["str_form"]
    @vit_form = params["vit_form"]
    @int_form = params["int_form"]
    @mnd_form = params["mnd_form"]
    @tec_form = params["tec_form"]
    @eva_form = params["eva_form"]

    @target_rank_form = params["target_rank_form"]

    @target_str_form = params["target_str_form"]
    @target_vit_form = params["target_vit_form"]
    @target_int_form = params["target_int_form"]
    @target_mnd_form = params["target_mnd_form"]
    @target_tec_form = params["target_tec_form"]
    @target_eva_form = params["target_eva_form"]
    
    @party_num_form = params["party_num_form"]
    @target_party_num_form = params["target_party_num_form"]

    @show_detail_battle_page = params["show_detail_battle_page"]
    @show_detail_parameter_development = params["show_detail_parameter_development"]
    @show_detail_characteristic = params["show_detail_characteristic"]
    @show_detail_party = params["show_detail_party"]
    @show_detail_target = params["show_detail_target"]
    @show_detail_target_parameter_development = params["show_detail_target_parameter_development"]
    @show_detail_target_characteristic = params["show_detail_target_characteristic"]
    @show_detail_damage_option = params["show_detail_damage_option"]
    @base_first    = (!params["is_form"]) ? "1" : "0"
  end
  # GET /damages/1
  #def show
  #end

  # GET /damages/new
  #def new
  #  @damage = Damage.new
  #end

  # GET /damages/1/edit
  #def edit
  #end

  # POST /damages
  #def create
  #  @damage = Damage.new(damage_params)

  #  if @damage.save
  #    redirect_to @damage, notice: 'Damage was successfully created.'
  #  else
  #    render action: 'new'
  #  end
  #end

  # PATCH/PUT /damages/1
  #def update
  #  if @damage.update(damage_params)
  #    redirect_to @damage, notice: 'Damage was successfully updated.'
  #  else
  #    render action: 'edit'
  #  end
  #end

  # DELETE /damages/1
  #def destroy
  #  @damage.destroy
  #  redirect_to damages_url, notice: 'Damage was successfully destroyed.'
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_damage
      @damage = Damage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def damage_params
      params.require(:damage).permit(:result_no, :generate_no, :battle_page, :e_no, :card_id, :chain, :target_e_no, :act_type, :element, :damage)
    end
end
