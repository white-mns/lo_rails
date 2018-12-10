class Bug < ApplicationRecord
	belongs_to :p_name,	            :foreign_key => [:e_no, :result_no, :generate_no],     :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :development_result,	:foreign_key => [:e_no, :result_no, :generate_no],     :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'DevelopmentResult'
	belongs_to :pre_win,            :foreign_key => [:e_no, :result_no, :generate_no],     :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'PreWin'
	belongs_to :bug_name,           :foreign_key => [:bug_e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :bug_pre_win,        :foreign_key => [:bug_e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'PreWin'
    
    scope :where_front, ->(params)   {
        if params["only_front"] then
            where("bugs.result_no = bugs.lv")
        else
            nil
        end
    }
end
