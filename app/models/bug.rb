class Bug < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :p_name,	            :foreign_key => [:e_no, :result_no, :generate_no],     :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :development_result,	:foreign_key => [:e_no, :result_no, :generate_no],     :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'DevelopmentResult'
	belongs_to :pre_win,            :foreign_key => [:e_no, :result_no, :generate_no],     :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'PreWin'
	belongs_to :bug_name,           :foreign_key => [:bug_e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :bug_pre_win,        :foreign_key => [:bug_e_no, :lv],                      :primary_key => [:e_no, :result_no],               :class_name => 'PreWin'
    
    scope :where_front, ->(params)   {
        if params["only_front"] then
            where("bugs.result_no = bugs.lv")
        else
            nil
        end
    }
end
