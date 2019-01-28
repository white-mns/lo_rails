class Damage < ApplicationRecord
    def self.regexpProperName(proper_name, regexp)
        proper_name.inject(Array.new(0)){ |array , a| if a[0] =~ /#{regexp}/ then array.push(a[1]) end; array }
    end

    proper_name = ProperName.pluck(:name, :proper_id).inject(Hash.new(0)){|hash, a| hash[a[0]] = a[1] ; hash}

    attack_buffer  = regexpProperName(proper_name, "物攻.\\z")
    defence_buffer = regexpProperName(proper_name, "物防.\\z")
    magic_buffer   = regexpProperName(proper_name, "理力.\\z")
    resist_buffer  = regexpProperName(proper_name, "抵抗.\\z")
    hit_buffer     = regexpProperName(proper_name, "命中.\\z")
    dodge_buffer   = regexpProperName(proper_name, "回避.\\z")
    death_buffer   = regexpProperName(proper_name, "必殺.\\z")
    control_buffer = regexpProperName(proper_name, "制御.\\z")
    reinforcement  = regexpProperName(proper_name, "\\A.{2,3}強化フィールド")
    conversion     = regexpProperName(proper_name, "\\A.{2,3}変換フィールド")
    chain_power    = proper_name["鎖力"]
    all_fp_damage  = proper_name["完全FP"]
    all_lp_damage  = proper_name["完全LP"]
    lpfp_damage    = proper_name["混合LPFP"]
    weak           = proper_name["WeakPoint"]
    critical       = proper_name["Critical"]
    clean          = proper_name["Clean Hit"]
    vanish         = proper_name["Vanish"]
    absorb         = proper_name["Absorb"]
    revenge        = proper_name["Revenge"]
    time_penalty   = proper_name["Time Penalty"]
    to_the_fallen  = proper_name["To the Fallen"]

	belongs_to :p_name,	                      :foreign_key => [:e_no, :result_no, :generate_no],         :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :target_p_name,                :foreign_key => [:target_e_no, :result_no, :generate_no],  :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :characteristic,               :foreign_key => [:e_no, :result_no, :generate_no],         :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Characteristic'
	belongs_to :target_characteristic,        :foreign_key => [:target_e_no, :result_no, :generate_no],  :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Characteristic'
	belongs_to :parameter_development,        :foreign_key => [:e_no, :result_no, :generate_no],         :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'ParameterDevelopment'
	belongs_to :target_parameter_development, :foreign_key => [:target_e_no, :result_no, :generate_no],  :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'ParameterDevelopment'
	belongs_to :poison,	        -> { where(buffer_id: proper_name["毒"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :paralysis,      -> { where(buffer_id: proper_name["麻"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :seal,           -> { where(buffer_id: proper_name["封"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :confusion,      -> { where(buffer_id: proper_name["乱"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :charm,          -> { where(buffer_id: proper_name["魅"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :attack_buffer,  -> { where(buffer_id: attack_buffer)},     :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :defence_buffer, -> { where(buffer_id: defence_buffer)},    :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :magic_buffer,   -> { where(buffer_id: magic_buffer)},      :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :resist_buffer,  -> { where(buffer_id: resist_buffer)},     :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :hit_buffer,     -> { where(buffer_id: hit_buffer)},        :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :dodge_buffer,   -> { where(buffer_id: dodge_buffer)},      :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :death_buffer,   -> { where(buffer_id: death_buffer)},      :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :control_buffer, -> { where(buffer_id: control_buffer)},    :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :reinforcement,  -> { where(buffer_id: reinforcement)},     :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :conversion,     -> { where(buffer_id: conversion)},        :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :chain_power,    -> { where(buffer_id: chain_power)},       :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :all_fp_damage,  -> { where(buffer_id: all_fp_damage)},     :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :all_lp_damage,  -> { where(buffer_id: all_lp_damage)},     :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :lpfp_damage,    -> { where(buffer_id: lpfp_damage)},       :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :weak,           -> { where(buffer_id: weak)},              :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :critical,       -> { where(buffer_id: critical)},          :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :clean,          -> { where(buffer_id: clean)},             :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :vanish,         -> { where(buffer_id: vanish)},            :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :absorb,         -> { where(buffer_id: absorb)},            :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :revenge,        -> { where(buffer_id: revenge)},           :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :time_penalty,   -> { where(buffer_id: time_penalty)},      :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :to_the_fallen,  -> { where(buffer_id: to_the_fallen)},     :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :card_data,      :foreign_key => :card_id,  :primary_key => :card_id,   :class_name => 'CardDatum'
	belongs_to :act_type_name,  :foreign_key => :act_type, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :element_name,   :foreign_key => :element,  :primary_key => :proper_id, :class_name => 'ProperName'

    scope :where_dodge, ->(show_detail_dodge, only_dodge)   {
        if show_detail_dodge == "1" then
            if only_dodge == "on" then
                where(damage: -1)
            else
                return nil
            end
        else
            where(damage: 0..Float::INFINITY)
        end
    }

    scope :where_target_type, ->(only_friend, only_enemy)   {
        if only_friend == "on" && only_enemy == "on" then
            return nil
        elsif only_friend == "on" then
            where("target_party = party")
        elsif only_enemy == "on" then
            where("target_party != party")
        end
    }
    
    scope :all_includes, ->(params) {
        includes(:p_name, :act_type_name, [card_data: :kind_name]).
        target_includes(params).
        element_includes(params).
        characteristic_includes(params).
        target_characteristic_includes(params).
        parameter_development_includes(params).
        abnormal_includes(params).
        damage_option_includes(params). 
        buffer_includes(params).
        reinforcement_includes(params).
        conversion_includes(params).
        chain_power_includes(params).
        fp_type_includes(params)
    }

    scope :element_includes, ->(params) {
        if params["show_detail_element"] == "1" then includes(:element_name) end
    }

    scope :target_includes, ->(params) {
        if params["show_detail_target"] == "1" then includes(:target_p_name) end
    }

    scope :characteristic_includes, ->(params) {
        if params["show_detail_characteristic"] == "1" then includes(:characteristic) end
    }

    scope :target_characteristic_includes, ->(params) {
        if params["show_detail_target_characteristic"] == "1" then includes(:target_characteristic) end
    }

    scope :parameter_development_includes, ->(params) {
        if params["show_detail_parameter_development"] == "1" then includes(:parameter_development, :target_parameter_development) end
    }

    scope :damage_option_includes, ->(params) {
        if params["show_detail_damage_option"] == "1" then includes([weak: :buffer], [critical: :buffer], [clean: :buffer], [vanish: :buffer], [absorb: :buffer], [revenge: :buffer]) end
    }

    scope :abnormal_includes, ->(params) {
        if params["show_detail_abnormal"] == "1" then includes([poison: :buffer], [paralysis: :buffer], [seal: :buffer], [confusion: :buffer], [charm: :buffer]) end
    }

    scope :buffer_includes, ->(params) {
        if params["show_detail_buffer"] == "1" then includes([attack_buffer: :buffer], [defence_buffer: :buffer], [magic_buffer: :buffer], [resist_buffer: :buffer], [hit_buffer: :buffer], [dodge_buffer: :buffer], [death_buffer: :buffer], [control_buffer: :buffer]) end
    }

    scope :reinforcement_includes, ->(params) {
        if params["show_detail_reinforcement"] == "1" then includes([reinforcement: :buffer]) end
    }

    scope :conversion_includes, ->(params) {
        if params["show_detail_conversion"] == "1" then includes([conversion: :buffer]) end
    }

    scope :chain_power_includes, ->(params) {
        if params["show_detail_chain_power"] == "1" then includes([chain_power: :buffer]) end
    }

    scope :fp_type_includes, ->(params) {
        if params["show_detail_fp_type"] == "1" then includes([all_fp_damage: :buffer], [all_lp_damage: :buffer], [lpfp_damage: :buffer]) end
    }

    scope :to_damage_range_graph, -> (column) {
        max = self.pluck(column).max
        min = self.pluck(column).min
        
        if !max then return nil end
        
        figure_length = max.to_s.length # 桁数取得
        
        range = ((max - min) / 20).to_i
        floor_num = (10 ** (range.to_s.length - 1))
        range = (range / floor_num).to_i # 範囲の最上位桁の値を1,2,5のいずれかにする
        range = range <= 2 ? range : 5
        range = range * floor_num
        
        if range == 0 then range = 1 end
        
        pluck(column).inject(Hash.new(0)){|hash, a| floor= (a/range).to_i()*range;
                                        if range > 1 then
                                            hash[floor.to_s.rjust(figure_length) + "～" + (floor+range-1).to_s.rjust(figure_length)] += 1
                                        else
                                            hash[floor.to_s.rjust(figure_length)] += 1;
                                        end
                                        hash}.sort
    }
end
