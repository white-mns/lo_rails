class ParameterDevelopment < ApplicationRecord
	belongs_to :p_name,	                                                                 :foreign_key => [:e_no, :result_no, :generate_no],           :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :parameter_control,                                                       :foreign_key => [:e_no, :result_no, :generate_no],           :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'ParameterControl'
	belongs_to :last_parameter,                                                          :foreign_key => [:e_no, :last_result_no, :last_generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'ParameterControl'
	belongs_to :facility_use_1, -> { where(number: 1, recovery_lv: 1..Float::INFINITY)}, :foreign_key => [:e_no, :result_no, :generate_no],           :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'FacilityUse'
	belongs_to :facility_use_2, -> { where(number: 2, recovery_lv: 1..Float::INFINITY)}, :foreign_key => [:e_no, :result_no, :generate_no],           :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'FacilityUse'
	belongs_to :item_use,       -> { where(recovery_lv: 1..Float::INFINITY)},            :foreign_key => [:e_no, :result_no, :generate_no],           :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'ItemUse'
	belongs_to :dice_1,         -> { where(number: 1)},                                  :foreign_key => [:e_no, :result_no, :generate_no],           :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Dice'
	belongs_to :dice_2,         -> { where(number: 2)},                                  :foreign_key => [:e_no, :result_no, :generate_no],           :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Dice'
	belongs_to :development_result,                                                      :foreign_key => [:e_no, :result_no, :generate_no],           :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'DevelopmentResult'
	belongs_to :place,                                                                   :foreign_key => [:e_no, :result_no, :generate_no],           :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Place'
	belongs_to :cond_name,  :foreign_key => :cond,    :primary_key => :proper_id, :class_name => 'ProperName'
end
