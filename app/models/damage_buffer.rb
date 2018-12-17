class DamageBuffer < ApplicationRecord
	belongs_to :p_name,	      :foreign_key => [:e_no, :result_no, :generate_no],         :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :buffer,  :foreign_key => :buffer_id, :primary_key => :proper_id, :class_name => 'ProperName'
end
