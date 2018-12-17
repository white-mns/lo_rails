class Damage < ApplicationRecord
    proper_name = ProperName.pluck(:name, :proper_id).inject(Hash.new(0)){|hash, a| hash[a[0]] = a[1] ; hash}
    reinforcement = ProperName.where("name like '%強化フィールド'").pluck(:proper_id)
    conversion  = ProperName.where("name like '%変換フィールド'").pluck(:proper_id)
    attack_buffer  = ProperName.where("name like '物攻_'").pluck(:proper_id)
    defence_buffer = ProperName.where("name like '物防_'").pluck(:proper_id)
    magic_buffer   = ProperName.where("name like '理力_'").pluck(:proper_id)
    resist_buffer  = ProperName.where("name like '抵抗_'").pluck(:proper_id)
    hit_buffer     = ProperName.where("name like '命中_'").pluck(:proper_id)
    dodge_buffer   = ProperName.where("name like '回避_'").pluck(:proper_id)
    death_buffer   = ProperName.where("name like '必殺_'").pluck(:proper_id)
    control_buffer = ProperName.where("name like '制御_'").pluck(:proper_id)
	belongs_to :p_name,	                      :foreign_key => [:e_no, :result_no, :generate_no],         :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :target_p_name,                :foreign_key => [:target_e_no, :result_no, :generate_no],  :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :characteristic,               :foreign_key => [:e_no, :result_no, :generate_no],         :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Characteristic'
	belongs_to :target_characteristic,        :foreign_key => [:target_e_no, :result_no, :generate_no],  :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Characteristic'
	belongs_to :parameter_development,        :foreign_key => [:e_no, :result_no, :generate_no],         :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'ParameterDevelopment'
	belongs_to :target_parameter_development, :foreign_key => [:target_e_no, :result_no, :generate_no],  :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'ParameterDevelopment'
	belongs_to :poison,	   -> { where(buffer_id: proper_name["毒"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :paralysis, -> { where(buffer_id: proper_name["麻"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :seal,      -> { where(buffer_id: proper_name["封"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :confusion, -> { where(buffer_id: proper_name["乱"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :charm,     -> { where(buffer_id: proper_name["魅"])}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :attack_buffer,  -> { where(buffer_id: attack_buffer)},  :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :defence_buffer, -> { where(buffer_id: defence_buffer)}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :magic_buffer,   -> { where(buffer_id: magic_buffer)},   :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :resist_buffer,  -> { where(buffer_id: resist_buffer)},  :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :hit_buffer,     -> { where(buffer_id: hit_buffer)},     :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :dodge_buffer,   -> { where(buffer_id: dodge_buffer)},   :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :death_buffer,   -> { where(buffer_id: death_buffer)},   :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :control_buffer, -> { where(buffer_id: control_buffer)}, :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :reinforcement,  -> { where(buffer_id: reinforcement)},  :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
	belongs_to :conversion,     -> { where(buffer_id: conversion)},     :foreign_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :primary_key => [:battle_page, :act_id, :e_no, :result_no, :generate_no], :class_name => 'DamageBuffer'
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
end
