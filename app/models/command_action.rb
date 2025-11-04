class CommandAction < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :p_name,	     :foreign_key => [:e_no, :result_no, :generate_no],        :primary_key => [:e_no, :result_no, :generate_no],        :class_name => 'Name'
	belongs_to :s_no_data,   :foreign_key => [:e_no, :s_no, :result_no, :generate_no], :primary_key => [:e_no, :s_no, :result_no, :generate_no], :class_name => 'Card'
	belongs_to :card_data,   :foreign_key => :card_id,    :primary_key => :card_id,   :class_name => 'CardDatum'
	belongs_to :timing_name, :foreign_key => :timing,  :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :gowait_name, :foreign_key => :gowait,  :primary_key => :proper_id, :class_name => 'ProperName'
end
