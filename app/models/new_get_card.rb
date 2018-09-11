class NewGetCard < ApplicationRecord
	belongs_to :card_data,       :foreign_key => :card_id,    :primary_key => :card_id,   :class_name => 'CardDatum'
end
