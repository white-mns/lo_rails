class GetCard < ApplicationRecord
	belongs_to :p_name,	         :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :card_data,       :foreign_key => :card_id,    :primary_key => :card_id,   :class_name => 'CardDatum'
	belongs_to :subject,         :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Subject'
	belongs_to :training,        :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Subject'
	has_many :speciality, -> { where(pgws_type: [7..8]) }, :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Pgw'
	has_many :training,   -> { where(training_type: 1) },  :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Training'
end
