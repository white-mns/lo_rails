class Facility < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :holiday_name,         :foreign_key => :holiday,         :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :division_name,        :foreign_key => :division,        :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :detail_division_name, :foreign_key => :detail_division, :primary_key => :proper_id, :class_name => 'ProperName'
end
