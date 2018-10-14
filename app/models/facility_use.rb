class FacilityUse < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :facility_effect_name, :foreign_key => :facility_effect, :primary_key => :proper_id, :class_name => 'ProperName'
end
