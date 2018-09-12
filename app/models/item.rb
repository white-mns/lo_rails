class Item < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :equip_name,  :foreign_key => :equip,  :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :kind_name,   :foreign_key => :kind,   :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :effect_name, :foreign_key => :effect, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :detail,      :foreign_key => :effect, :primary_key => :detail,    :class_name => 'FacilityDivisionDatum'
end
