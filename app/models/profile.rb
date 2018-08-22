class Profile < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :tone_name,  :foreign_key => :tone,    :primary_key => :proper_id, :class_name => 'ProperName'
end
