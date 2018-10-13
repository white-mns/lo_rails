class Mission < ApplicationRecord
	belongs_to :p_name,	  :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :mission,  :foreign_key => :mission_id,  :primary_key => :mission_id, :class_name => 'MissionName'
end
