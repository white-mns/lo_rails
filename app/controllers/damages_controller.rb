class DamagesController < ApplicationController
  include MyUtility
  before_action :set_damage, only: [:show, :edit, :update, :destroy]

  # GET /damages
  def index
    placeholder_set
    param_set
    @count	= Damage.notnil().where_dodge(@form_params["show_detail_dodge"], @form_params["only_dodge"]).where_target_type(@form_params["only_friend"], @form_params["only_enemy"]).all_includes(params).search(params[:q]).result.count()
    @search	= Damage.notnil().where_dodge(@form_params["show_detail_dodge"], @form_params["only_dodge"]).where_target_type(@form_params["only_friend"], @form_params["only_enemy"]).all_includes(params).page(params[:page]).search(params[:q])
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
    @form_params = {}

    @latest_result = Name.maximum('result_no')
    
    params_clean(params)
    if !params["is_form"] then
        params["result_no_form"] ||= sprintf('%d',@latest_result)
    end
    
    params_to_form(params, @form_params, column_name: "p_name_name", params_name: "p_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "target_p_name_name", params_name: "target_p_name_form", type: "text")
    params_to_form(params, @form_params, column_name: "result_no", params_name: "result_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "generate_no", params_name: "generate_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "battle_page", params_name: "battle_page_form", type: "text")
    params_to_form(params, @form_params, column_name: "e_no", params_name: "e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "card_id", params_name: "card_id_form", type: "number")
    params_to_form(params, @form_params, column_name: "chain", params_name: "chain_form", type: "number")
    params_to_form(params, @form_params, column_name: "target_e_no", params_name: "target_e_no_form", type: "number")
    params_to_form(params, @form_params, column_name: "element_name_name", params_name: "element_form", type: "text")
    params_to_form(params, @form_params, column_name: "damage", params_name: "damage_form", type: "number")
    params_to_form(params, @form_params, column_name: "party_num",        params_name: "party_num_form",        type: "number")
    params_to_form(params, @form_params, column_name: "target_party_num", params_name: "target_party_num_form", type: "number")
    params_to_form(params, @form_params, column_name: "turn", params_name: "turn_form", type: "number")

    params_to_form(params, @form_params, column_name: "card_data_kind_name_name", params_name: "kind_form",   type: "text")
    params_to_form(params, @form_params, column_name: "card_data_name",           params_name: "effect_form", type: "text")
    params_to_form(params, @form_params, column_name: "card_data_lv",             params_name: "lv_form",     type: "number")
    params_to_form(params, @form_params, column_name: "card_data_lp",             params_name: "lp_form",     type: "number")
    params_to_form(params, @form_params, column_name: "card_data_fp",             params_name: "fp_form",     type: "number")
    params_to_form(params, @form_params, column_name: "card_data_lpfp",           params_name: "lp_fp_form",  type: "number")
    
    params_to_form(params, @form_params, column_name: "parameter_development_rank", params_name: "rank_form", type: "number")

    params_to_form(params, @form_params, column_name: "characteristic_str", params_name: "str_form", type: "number")
    params_to_form(params, @form_params, column_name: "characteristic_vit", params_name: "vit_form", type: "number")
    params_to_form(params, @form_params, column_name: "characteristic_int", params_name: "int_form", type: "number")
    params_to_form(params, @form_params, column_name: "characteristic_mnd", params_name: "mnd_form", type: "number")
    params_to_form(params, @form_params, column_name: "characteristic_tec", params_name: "tec_form", type: "number")
    params_to_form(params, @form_params, column_name: "characteristic_eva", params_name: "eva_form", type: "number")
    
    params_to_form(params, @form_params, column_name: "target_parameter_development_rank", params_name: "target_rank_form", type: "number")

    params_to_form(params, @form_params, column_name: "target_characteristic_str", params_name: "target_str_form", type: "number")
    params_to_form(params, @form_params, column_name: "target_characteristic_vit", params_name: "target_vit_form", type: "number")
    params_to_form(params, @form_params, column_name: "target_characteristic_int", params_name: "target_int_form", type: "number")
    params_to_form(params, @form_params, column_name: "target_characteristic_mnd", params_name: "target_mnd_form", type: "number")
    params_to_form(params, @form_params, column_name: "target_characteristic_tec", params_name: "target_tec_form", type: "number")
    params_to_form(params, @form_params, column_name: "target_characteristic_eva", params_name: "target_eva_form", type: "number")
    
    params_to_form(params, @form_params, column_name: "poison_lv", params_name: "poison_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "poison_value", params_name: "poison_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "paralysis_lv", params_name: "paralysis_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "paralysis_value", params_name: "paralysis_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "seal_lv", params_name: "seal_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "seal_value", params_name: "seal_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "confusion_lv", params_name: "confusion_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "confusion_value", params_name: "confusion_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "charm_lv", params_name: "charm_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "charm_value", params_name: "charm_value_form", type: "number")

    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_poison", query_name:"poison_lv_blank",  value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_paralysis", query_name:"paralysis_lv_blank",  value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_seal", query_name:"seal_lv_blank",  value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_confusion", query_name:"confusion_lv_blank",  value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_charm", query_name:"charm_lv_blank",  value: true})

    params_to_form(params, @form_params, column_name: "attack_buffer_lv", params_name: "attack_buffer_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "attack_buffer_value", params_name: "attack_buffer_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "defence_buffer_lv", params_name: "defence_buffer_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "defence_buffer_value", params_name: "defence_buffer_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "magic_buffer_lv", params_name: "magic_buffer_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "magic_buffer_value", params_name: "magic_buffer_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "resist_buffer_lv", params_name: "resist_buffer_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "resist_buffer_value", params_name: "resist_buffer_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "hit_buffer_lv", params_name: "hit_buffer_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "hit_buffer_value", params_name: "hit_buffer_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "dodge_buffer_lv", params_name: "dodge_buffer_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "dodge_buffer_value", params_name: "dodge_buffer_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "death_buffer_lv", params_name: "death_buffer_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "death_buffer_value", params_name: "death_buffer_value_form", type: "number")
    params_to_form(params, @form_params, column_name: "control_buffer_lv", params_name: "control_buffer_lv_form", type: "number")
    params_to_form(params, @form_params, column_name: "control_buffer_value", params_name: "control_buffer_value_form", type: "number")

    checkbox_params_set_query_any(params, @form_params, query_name: "attack_buffer_buffer_name_cont_any",
                             checkboxes: [{params_name: "buff_attack_buffer",   value: "強"},
                                          {params_name: "debuff_attack_buffer", value: "弱"}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_attack_buffer", query_name:"attack_buffer_lv_blank",  value: true})
    checkbox_params_set_query_any(params, @form_params, query_name: "defence_buffer_buffer_name_cont_any",
                             checkboxes: [{params_name: "buff_defence_buffer",   value: "強"},
                                          {params_name: "debuff_defence_buffer", value: "弱"}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_defence_buffer", query_name:"defence_buffer_lv_blank",  value: true})
    checkbox_params_set_query_any(params, @form_params, query_name: "magic_buffer_buffer_name_cont_any",
                             checkboxes: [{params_name: "buff_magic_buffer",   value: "強"},
                                          {params_name: "debuff_magic_buffer", value: "弱"}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_magic_buffer", query_name:"magic_buffer_lv_blank",  value: true})
    checkbox_params_set_query_any(params, @form_params, query_name: "resist_buffer_buffer_name_cont_any",
                             checkboxes: [{params_name: "buff_resist_buffer",   value: "強"},
                                          {params_name: "debuff_resist_buffer", value: "弱"}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_resist_buffer", query_name:"resist_buffer_lv_blank",  value: true})
    checkbox_params_set_query_any(params, @form_params, query_name: "hit_buffer_buffer_name_cont_any",
                             checkboxes: [{params_name: "buff_hit_buffer",   value: "強"},
                                          {params_name: "debuff_hit_buffer", value: "弱"}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_hit_buffer", query_name:"hit_buffer_lv_blank",  value: true})
    checkbox_params_set_query_any(params, @form_params, query_name: "dodge_buffer_buffer_name_cont_any",
                             checkboxes: [{params_name: "buff_dodge_buffer",   value: "強"},
                                          {params_name: "debuff_dodge_buffer", value: "弱"}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_dodge_buffer", query_name:"dodge_buffer_lv_blank",  value: true})
    checkbox_params_set_query_any(params, @form_params, query_name: "death_buffer_buffer_name_cont_any",
                             checkboxes: [{params_name: "buff_death_buffer",   value: "強"},
                                          {params_name: "debuff_death_buffer", value: "弱"}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_death_buffer", query_name:"death_buffer_lv_blank",  value: true})
    checkbox_params_set_query_any(params, @form_params, query_name: "control_buffer_buffer_name_cont_any",
                             checkboxes: [{params_name: "buff_control_buffer",   value: "強"},
                                          {params_name: "debuff_control_buffer", value: "弱"}])
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_control_buffer", query_name:"control_buffer_lv_blank",  value: true})

    checkbox_params_set_query_any(params, @form_params, query_name: "line_eq_any",
                             checkboxes: [{params_name: "line_front",  value: 0},
                                          {params_name: "line_middle", value: 1},
                                          {params_name: "line_back",   value: 2}])

    checkbox_params_set_query_any(params, @form_params, query_name: "target_line_eq_any",
                             checkboxes: [{params_name: "target_line_front",  value: 0},
                                          {params_name: "target_line_middle", value: 1},
                                          {params_name: "target_line_back",   value: 2}])

    proper_name = ProperName.pluck(:name, :proper_id).inject(Hash.new(0)){|hash, a| hash[a[0]] = a[1] ; hash}
    checkbox_params_set_query_any(params, @form_params, query_name: "act_type_eq_any",
                             checkboxes: [{params_name: "act_type_damage",     value: proper_name["ダメージ"],   first_checked: true},
                                          {params_name: "act_type_fp_damage",  value: proper_name["FPダメージ"], first_checked: true},
                                          {params_name: "act_type_lp_heal",    value: proper_name["LP回復"],     first_checked: true},
                                          {params_name: "act_type_fp_heal",    value: proper_name["FP回復"],     first_checked: true}])
   
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_weak",     query_name:"weak_value_gteq",     value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_critical", query_name:"critical_value_gteq", value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_clean",    query_name:"clean_value_gteq",    value: 1})

    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_weak",     query_name:"weak_value_blank",     value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_critical", query_name:"critical_value_blank", value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_clean",    query_name:"clean_value_blank",    value: true})

    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_vanish",        query_name:"vanish_value_gteq",        value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_absorb",        query_name:"absorb_value_gteq",        value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_revenge",       query_name:"revenge_value_gteq",       value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_time_penalty",  query_name:"time_penalty_value_gteq",  value: 1})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_to_the_fallen", query_name:"to_the_fallen_value_gteq", value: 1})

    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_vanish",        query_name:"vanish_value_blank",        value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_absorb",        query_name:"absorb_value_blank",        value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_revenge",       query_name:"revenge_value_blank",       value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_time_penalty",  query_name:"time_penalty_value_blank",  value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_to_the_fallen", query_name:"to_the_fallen_value_blank", value: true})

    params_to_form(params, @form_params, column_name: "reinforcement_lv",          params_name: "reinforcement_lv_form",   type: "number")
    params_to_form(params, @form_params, column_name: "reinforcement_buffer_name", params_name: "reinforcement_name_form", type: "text")
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_reinforcement", query_name:"reinforcement_lv_blank",  value: true})

    params_to_form(params, @form_params, column_name: "conversion_lv",          params_name: "conversion_lv_form",   type: "number")
    params_to_form(params, @form_params, column_name: "conversion_buffer_name", params_name: "conversion_name_form", type: "text")
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "is_conversion", query_name:"conversion_lv_not_null",  value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_conversion", query_name:"conversion_lv_blank",  value: true})

    params_to_form(params, @form_params, column_name: "chain_power_value", params_name: "chain_power_value_form", type: "number")
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "no_chain_power", query_name:"chain_power_lv_blank",  value: true})
    
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "all_fp_damage", query_name:"all_fp_damage_value_not_null",  value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "all_lp_damage", query_name:"all_lp_damage_value_not_null",  value: true})
    checkbox_params_set_query_single(params, @form_params, checkbox: {params_name: "lpfp_damage",   query_name:"lpfp_damage_value_not_null",    value: true})

    @form_params["only_friend"] = params["only_friend"]
    @form_params["only_enemy"] = params["only_enemy"]

    @form_params["only_dodge"] = params["only_dodge"]
    
    @form_params["show_statistics"] = (!params["is_form"]) ? "on" : params["show_statistics"]
    @form_params["show_graph"] = params["show_graph"]

    toggle_params_to_variable(params, @form_params, params_name: "show_detail_battle_page")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_turn")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_parameter_development")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_characteristic")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_line")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_party")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_user")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_target")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_target_characteristic")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_damage_option")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_card_option")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_element")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_abnormal")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_buffer")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_reinforcement")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_conversion")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_chain_power")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_target_type")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_fp_type")
    toggle_params_to_variable(params, @form_params, params_name: "show_detail_dodge")
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
