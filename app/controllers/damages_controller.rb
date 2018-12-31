class DamagesController < ApplicationController
  include MyUtility
  before_action :set_damage, only: [:show, :edit, :update, :destroy]

  # GET /damages
  def index
    placeholder_set
    param_set
    @count	= Damage.notnil().where_dodge(@show_detail_dodge, @only_dodge).where_target_type(@only_friend, @only_enemy).all_includes(params).search(params[:q]).result.count()
    @search	= Damage.notnil().where_dodge(@show_detail_dodge, @only_dodge).where_target_type(@only_friend, @only_enemy).all_includes(params).page(params[:page]).search(params[:q])
    @search.sorts = 'id asc' if @search.sorts.empty?
    @damages	= @search.result.per(50)

    @stat_search = Damage.notnil().includes(:act_type_name)
        .group(:act_type)
        .select("damages.act_type,
                count(*) AS count,
                SUM(CASE WHEN damage >= 0 THEN damage ELSE 0 END) AS sum,
                MAX(CASE WHEN damage >= 0 THEN damage ELSE 0 END) AS max,
                MIN(CASE WHEN damage >= 0 THEN damage ELSE 0 END) AS min,
                SUM(CASE WHEN damage >= 0 THEN damage ELSE 0 END) / COUNT(damage >= 0 or null) AS avg,
                COUNT(damage >= 0 or null) AS hit,
                COUNT(damage = -1 or null) AS dodge
                ")
        .search(params[:q])
    @stat_search.sorts = 'act_type asc'
    @statistics = @stat_search.result
  end

  def param_set
    @latest_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
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
    reference_text_assign(params, "element_name_name", "element_form")
    reference_number_assign(params, "damage", "damage_form")
    reference_number_assign(params, "party_num", "party_num_form")
    reference_number_assign(params, "target_party_num", "target_party_num_form")
    reference_number_assign(params, "turn", "turn_form")

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
    
    reference_number_assign(params, "poison_lv", "poison_lv_form")
    reference_number_assign(params, "paralysis_lv", "paralysis_lv_form")
    reference_number_assign(params, "seal_lv", "seal_lv_form")
    reference_number_assign(params, "confusion_lv", "confusion_lv_form")
    reference_number_assign(params, "charm_lv", "charm_lv_form")
    reference_number_assign(params, "poison_value", "poison_value_form")
    reference_number_assign(params, "paralysis_value", "paralysis_value_form")
    reference_number_assign(params, "seal_value", "seal_value_form")
    reference_number_assign(params, "confusion_value", "confusion_value_form")
    reference_number_assign(params, "charm_value", "charm_value_form")

    if params["no_poison"]    == "on" then params[:q]["poison_lv_blank"]    = true end
    if params["no_paralysis"] == "on" then params[:q]["paralysis_lv_blank"] = true end
    if params["no_seal"]      == "on" then params[:q]["seal_lv_blank"]      = true end
    if params["no_confusion"] == "on" then params[:q]["confusion_lv_blank"] = true end
    if params["no_charm"]     == "on" then params[:q]["charm_lv_blank"]     = true end

    reference_number_assign(params, "attack_buffer_lv", "attack_buffer_lv_form")
    reference_number_assign(params, "attack_buffer_value", "attack_buffer_value_form")
    reference_number_assign(params, "defence_buffer_lv", "defence_buffer_lv_form")
    reference_number_assign(params, "defence_buffer_value", "defence_buffer_value_form")
    reference_number_assign(params, "magic_buffer_lv", "magic_buffer_lv_form")
    reference_number_assign(params, "magic_buffer_value", "magic_buffer_value_form")
    reference_number_assign(params, "resist_buffer_lv", "resist_buffer_lv_form")
    reference_number_assign(params, "resist_buffer_value", "resist_buffer_value_form")
    reference_number_assign(params, "hit_buffer_lv", "hit_buffer_lv_form")
    reference_number_assign(params, "hit_buffer_value", "hit_buffer_value_form")
    reference_number_assign(params, "dodge_buffer_lv", "dodge_buffer_lv_form")
    reference_number_assign(params, "dodge_buffer_value", "dodge_buffer_value_form")
    reference_number_assign(params, "death_buffer_lv", "death_buffer_lv_form")
    reference_number_assign(params, "death_buffer_value", "death_buffer_value_form")
    reference_number_assign(params, "control_buffer_lv", "control_buffer_lv_form")
    reference_number_assign(params, "control_buffer_value", "control_buffer_value_form")

    params[:q]["attack_buffer_buffer_name_cont_any"] = []
    params[:q]["defence_buffer_buffer_name_cont_any"] = []
    params[:q]["magic_buffer_buffer_name_cont_any"] = []
    params[:q]["resist_buffer_buffer_name_cont_any"] = []
    params[:q]["hit_buffer_buffer_name_cont_any"] = []
    params[:q]["dodge_buffer_buffer_name_cont_any"] = []
    params[:q]["death_buffer_buffer_name_cont_any"] = []
    params[:q]["control_buffer_buffer_name_cont_any"] = []
    if params["buff_attack_buffer"]    == "on" then params[:q]["attack_buffer_buffer_name_cont_any"].push("強") end
    if params["debuff_attack_buffer"]  == "on" then params[:q]["attack_buffer_buffer_name_cont_any"].push("弱") end
    if params["no_attack_buffer"]      == "on" then params[:q]["attack_buffer_lv_blank"] = true end
    if params["buff_defence_buffer"]   == "on" then params[:q]["defence_buffer_buffer_name_cont_any"].push("強") end
    if params["debuff_defence_buffer"] == "on" then params[:q]["defence_buffer_buffer_name_cont_any"].push("弱") end
    if params["no_defence_buffer"]     == "on" then params[:q]["defence_buffer_lv_blank"] = true end
    if params["buff_magic_buffer"]     == "on" then params[:q]["magic_buffer_buffer_name_cont_any"].push("強") end
    if params["debuff_magic_buffer"]   == "on" then params[:q]["magic_buffer_buffer_name_cont_any"].push("弱") end
    if params["no_magic_buffer"]       == "on" then params[:q]["magic_buffer_lv_blank"] = true end
    if params["buff_resist_buffer"]    == "on" then params[:q]["resist_buffer_buffer_name_cont_any"].push("強") end
    if params["debuff_resist_buffer"]  == "on" then params[:q]["resist_buffer_buffer_name_cont_any"].push("弱") end
    if params["no_resist_buffer"]      == "on" then params[:q]["resist_buffer_lv_blank"] = true end
    if params["buff_hit_buffer"]       == "on" then params[:q]["hit_buffer_buffer_name_cont_any"].push("強") end
    if params["debuff_hit_buffer"]     == "on" then params[:q]["hit_buffer_buffer_name_cont_any"].push("弱") end
    if params["no_hit_buffer"]         == "on" then params[:q]["hit_buffer_lv_blank"] = true end
    if params["buff_dodge_buffer"]     == "on" then params[:q]["dodge_buffer_buffer_name_cont_any"].push("強") end
    if params["debuff_dodge_buffer"]   == "on" then params[:q]["dodge_buffer_buffer_name_cont_any"].push("弱") end
    if params["no_dodge_buffer"]       == "on" then params[:q]["dodge_buffer_lv_blank"] = true end
    if params["buff_death_buffer"]     == "on" then params[:q]["death_buffer_buffer_name_cont_any"].push("強") end
    if params["debuff_death_buffer"]   == "on" then params[:q]["death_buffer_buffer_name_cont_any"].push("弱") end
    if params["no_death_buffer"]       == "on" then params[:q]["death_buffer_lv_blank"] = true end
    if params["buff_control_buffer"]   == "on" then params[:q]["control_buffer_buffer_name_cont_any"].push("強") end
    if params["debuff_control_buffer"] == "on" then params[:q]["control_buffer_buffer_name_cont_any"].push("弱") end
    if params["no_control_buffer"]     == "on" then params[:q]["control_buffer_lv_blank"] = true end

    params[:q]["line_eq_any"] = []
    if params["line_front"]  == "on" then params[:q]["line_eq_any"].push(0) end
    if params["line_middle"] == "on" then params[:q]["line_eq_any"].push(1) end
    if params["line_back"]   == "on" then params[:q]["line_eq_any"].push(2) end

    params[:q]["target_line_eq_any"] = []
    if params["target_line_front"]  == "on" then params[:q]["target_line_eq_any"].push(0) end
    if params["target_line_middle"] == "on" then params[:q]["target_line_eq_any"].push(1) end
    if params["target_line_back"]   == "on" then params[:q]["target_line_eq_any"].push(2) end

    params[:q]["act_type_eq_any"] = []
    if !params["is_form"] then
        params["act_type_damage"]    = "on"
        params["act_type_fp_damage"] = "on"
        params["act_type_lp_heal"]   = "on"
        params["act_type_fp_heal"]   = "on"
    end

    proper_name = ProperName.pluck(:name, :proper_id).inject(Hash.new(0)){|hash, a| hash[a[0]] = a[1] ; hash}
    if params["act_type_damage"]     == "on" then params[:q]["act_type_eq_any"].push(proper_name["ダメージ"]) end
    if params["act_type_fp_damage"]  == "on" then params[:q]["act_type_eq_any"].push(proper_name["FPダメージ"]) end
    if params["act_type_lp_heal"]    == "on" then params[:q]["act_type_eq_any"].push(proper_name["LP回復"]) end
    if params["act_type_fp_heal"]    == "on" then params[:q]["act_type_eq_any"].push(proper_name["FP回復"]) end
    
    if params["is_weak"]     == "on" then params[:q]["weak_value_gteq"]     = 1 end
    if params["is_critical"] == "on" then params[:q]["critical_value_gteq"] = 1 end
    if params["is_clean"]    == "on" then params[:q]["clean_value_gteq"]    = 1 end
    if params["is_vanish"]   == "on" then params[:q]["vanish_value_gteq"]   = 1 end
    if params["is_absorb"]   == "on" then params[:q]["absorb_value_gteq"]   = 1 end
    if params["is_revenge"]  == "on" then params[:q]["revenge_value_gteq"]  = 1 end
    
    if params["no_weak"]     == "on" then params[:q]["weak_value_eq"]     = 0 end
    if params["no_critical"] == "on" then params[:q]["critical_value_eq"] = 0 end
    if params["no_clean"]    == "on" then params[:q]["clean_value_eq"]    = 0 end
    if params["no_vanish"]   == "on" then params[:q]["vanish_value_eq"]   = 0 end
    if params["no_absorb"]   == "on" then params[:q]["absorb_value_eq"]   = 0 end
    if params["no_revenge"]  == "on" then params[:q]["revenge_value_eq"]  = 0 end

    reference_number_assign(params, "reinforcement_lv", "reinforcement_lv_form")
    reference_text_assign(params, "reinforcement_buffer_name", "reinforcement_name_form")
    if params["no_reinforcement"]  == "on" then params[:q]["reinforcement_lv_blank"] = true end

    reference_number_assign(params, "conversion_lv", "conversion_lv_form")
    reference_text_assign(params, "conversion_buffer_name", "conversion_name_form")
    if params["is_conversion"]  == "on" then params[:q]["conversion_lv_not_null"] = true end
    if params["no_conversion"]  == "on" then params[:q]["conversion_lv_blank"] = true end

    reference_number_assign(params, "chain_power_value", "chain_power_value_form")
    if params["no_chain_power"]  == "on" then params[:q]["chain_power_lv_blank"] = true end
    
    if params["all_fp_damage"]  == "on" then params[:q]["all_fp_damage_value_not_null"] = true end
    if params["all_lp_damage"]  == "on" then params[:q]["all_lp_damage_value_not_null"] = true end
    if params["lpfp_damage"]    == "on" then params[:q]["lpfp_damage_value_not_null"]   = true end

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
    @turn_form = params["turn_form"]

    @possession_form = params["possession_form"]
    @kind_form = params["kind_form"]
    @effect_form = params["effect_form"]
    @lv_form = params["lv_form"]
    @lp_form = params["lp_form"]
    @fp_form = params["fp_form"]
    @lpfp_form = params["lpfp_form"]

    @line_front  = params["line_front"]
    @line_middle = params["line_middle"]
    @line_back   = params["line_back"]

    @target_line_front  = params["target_line_front"]
    @target_line_middle = params["target_line_middle"]
    @target_line_back   = params["target_line_back"]

    @act_type_damage    = params["act_type_damage"]
    @act_type_fp_damage = params["act_type_fp_damage"]
    @act_type_lp_heal   = params["act_type_lp_heal"]
    @act_type_fp_heal   = params["act_type_fp_heal"]
    
    @is_weak = params["is_weak"]
    @is_critical = params["is_critical"]
    @is_clean = params["is_clean"]
    @is_vanish = params["is_vanish"]
    @is_absorb = params["is_absorb"]
    @is_revenge = params["is_revenge"]
    
    @no_weak = params["no_weak"]
    @no_critical = params["no_critical"]
    @no_clean = params["no_clean"]
    @no_vanish = params["no_vanish"]
    @no_absorb = params["no_absorb"]
    @no_revenge = params["no_revenge"]
    
    @only_dodge = params["only_dodge"]

    @only_friend = params["only_friend"]
    @only_enemy = params["only_enemy"]
    
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

    @poison_lv_form = params["poison_lv_form"]
    @paralysis_lv_form = params["paralysis_lv_form"]
    @seal_lv_form = params["seal_lv_form"]
    @confusion_lv_form = params["confusion_lv_form"]
    @charm_lv_form = params["charm_lv_form"]
    @poison_value_form = params["poison_value_form"]
    @paralysis_value_form = params["paralysis_value_form"]
    @seal_value_form = params["seal_value_form"]
    @confusion_value_form = params["confusion_value_form"]
    @charm_value_form = params["charm_value_form"]
    @no_poison = params["no_poison"]
    @no_paralysis = params["no_paralysis"]
    @no_seal = params["no_seal"]
    @no_confusion = params["no_confusion"]
    @no_charm = params["no_charm"]

    @attack_buffer_lv_form = params["attack_buffer_lv_form"]
    @attack_buffer_value_form = params["attack_buffer_value_form"]
    @buff_attack_buffer = params["buff_attack_buffer"]
    @debuff_attack_buffer = params["debuff_attack_buffer"]
    @no_attack_buffer = params["no_attack_buffer"]
    @defence_buffer_lv_form = params["defence_buffer_lv_form"]
    @defence_buffer_value_form = params["defence_buffer_value_form"]
    @buff_defence_buffer = params["buff_defence_buffer"]
    @debuff_defence_buffer = params["debuff_defence_buffer"]
    @no_defence_buffer = params["no_defence_buffer"]
    @magic_buffer_lv_form = params["magic_buffer_lv_form"]
    @magic_buffer_value_form = params["magic_buffer_value_form"]
    @buff_magic_buffer = params["buff_magic_buffer"]
    @debuff_magic_buffer = params["debuff_magic_buffer"]
    @no_magic_buffer = params["no_magic_buffer"]
    @resist_buffer_lv_form = params["resist_buffer_lv_form"]
    @resist_buffer_value_form = params["resist_buffer_value_form"]
    @buff_resist_buffer = params["buff_resist_buffer"]
    @debuff_resist_buffer = params["debuff_resist_buffer"]
    @no_resist_buffer = params["no_resist_buffer"]
    @hit_buffer_lv_form = params["hit_buffer_lv_form"]
    @hit_buffer_value_form = params["hit_buffer_value_form"]
    @buff_hit_buffer = params["buff_hit_buffer"]
    @debuff_hit_buffer = params["debuff_hit_buffer"]
    @no_hit_buffer = params["no_hit_buffer"]
    @dodge_buffer_lv_form = params["dodge_buffer_lv_form"]
    @dodge_buffer_value_form = params["dodge_buffer_value_form"]
    @buff_dodge_buffer = params["buff_dodge_buffer"]
    @debuff_dodge_buffer = params["debuff_dodge_buffer"]
    @no_dodge_buffer = params["no_dodge_buffer"]
    @death_buffer_lv_form = params["death_buffer_lv_form"]
    @death_buffer_value_form = params["death_buffer_value_form"]
    @buff_death_buffer = params["buff_death_buffer"]
    @debuff_death_buffer = params["debuff_death_buffer"]
    @no_death_buffer = params["no_death_buffer"]
    @control_buffer_lv_form = params["control_buffer_lv_form"]
    @control_buffer_value_form = params["control_buffer_value_form"]
    @buff_control_buffer = params["buff_control_buffer"]
    @debuff_control_buffer = params["debuff_control_buffer"]
    @no_control_buffer = params["no_control_buffer"]

    @reinforcement_lv_form = params["reinforcement_lv_form"]
    @reinforcement_name_form = params["reinforcement_name_form"]
    @conversion_lv_form = params["conversion_lv_form"]
    @conversion_name_form = params["conversion_name_form"]
    @no_reinforcement = params["no_reinforcement"]
    @is_conversion = params["is_conversion"]
    @no_conversion = params["no_conversion"]

    @chain_power_value_form = params["chain_power_value_form"]
    @no_chain_power = params["no_chain_power"]

    @all_fp_damage = params["all_fp_damage"]
    @all_lp_damage = params["all_lp_damage"]
    @lpfp_damage = params["lpfp_damage"]

    @show_statistics = (!params["is_form"]) ? "on" : params["show_statistics"]
    @show_graph = params["show_graph"]

    @show_detail_battle_page = params["show_detail_battle_page"]
    @show_detail_turn = params["show_detail_turn"]
    @show_detail_parameter_development = params["show_detail_parameter_development"]
    @show_detail_characteristic = params["show_detail_characteristic"]
    @show_detail_line = params["show_detail_line"]
    @show_detail_party = params["show_detail_party"]
    @show_detail_target = params["show_detail_target"]
    @show_detail_target_characteristic = params["show_detail_target_characteristic"]
    @show_detail_damage_option = params["show_detail_damage_option"]
    @show_detail_dodge = params["show_detail_dodge"]
    @show_detail_line = params["show_detail_line"]
    @show_detail_element = params["show_detail_element"]
    @show_detail_abnormal = params["show_detail_abnormal"]
    @show_detail_buffer = params["show_detail_buffer"]
    @show_detail_reinforcement = params["show_detail_reinforcement"]
    @show_detail_chain_power = params["show_detail_chain_power"]
    @show_detail_conversion = params["show_detail_conversion"]
    @show_detail_target_type = params["show_detail_target_type"]
    @show_detail_fp_type = params["show_detail_fp_type"]
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
