class CardDatum < ApplicationRecord
	belongs_to :kind_name, :foreign_key => :kind, :primary_key => :proper_id, :class_name => 'ProperName'
end
