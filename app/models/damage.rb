class Damage < ApplicationRecord
	belongs_to :p_name,	               :foreign_key => [:e_no, :result_no, :generate_no],        :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :target_p_name,         :foreign_key => [:target_e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :characteristic,        :foreign_key => [:e_no, :result_no, :generate_no],        :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Characteristic'
	belongs_to :target_characteristic, :foreign_key => [:target_e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Characteristic'
	belongs_to :party_data,            :foreign_key => [:party, :result_no, :generate_no],        :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'DevelopmentResult'
	belongs_to :target_party_data,     :foreign_key => [:target_party, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'DevelopmentResult'
	belongs_to :card_data,      :foreign_key => :card_id,  :primary_key => :card_id,   :class_name => 'CardDatum'
	belongs_to :act_type_name,  :foreign_key => :act_type, :primary_key => :proper_id, :class_name => 'ProperName'
end
