class MeddlingSuccessRate < ApplicationRecord
	belongs_to :p_name,	   :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :card_data, :foreign_key => :card_id, :primary_key => :card_id, :class_name => 'CardDatum'
end
