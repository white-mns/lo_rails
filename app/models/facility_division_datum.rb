class FacilityDivisionDatum < ApplicationRecord
	belongs_to :detail_name, :foreign_key => :detail, :primary_key => :proper_id, :class_name => 'ProperName'
	belongs_to :major_name,  :foreign_key => :major,  :primary_key => :proper_id, :class_name => 'ProperName'
end
