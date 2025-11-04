class Profile < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :tone_name,  :foreign_key => :tone,    :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :potential1,  -> { where(pgws_type: "1") }, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Pgw'
	belongs_to :potential2,  -> { where(pgws_type: "2") }, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Pgw'
	belongs_to :good1,       -> { where(pgws_type: "3") }, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Pgw'
	belongs_to :good2,       -> { where(pgws_type: "4") }, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Pgw'
	belongs_to :weak1,       -> { where(pgws_type: "5") }, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Pgw'
	belongs_to :weak2,       -> { where(pgws_type: "6") }, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Pgw'
	belongs_to :speciality1, -> { where(pgws_type: "7") }, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Pgw'
	belongs_to :speciality2, -> { where(pgws_type: "8") }, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Pgw'
end
