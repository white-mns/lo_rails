class ItemUse < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'

    scope :group_eno_and_count, ->()   {
        select("*").
        select("COUNT(*) AS count").
        group(:e_no).
        order("count desc")
        
    }
end
