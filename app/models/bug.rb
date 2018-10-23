class Bug < ApplicationRecord
	belongs_to :p_name,	         :foreign_key => [:e_no, :result_no, :generate_no],     :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :bug_name,        :foreign_key => [:bug_e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
end
