class CardUser < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :card_data,  :foreign_key => :card_id, :primary_key => :card_id, :class_name =>'CardDatum'
 
    scope :group_e_no, ->() {
      group("card_users.result_no").group("card_users.e_no")
    }

    scope :group_battle_page, ->(params) {
      if params["pre_detail_open"] == "on" then
        group(:battle_page).group(:party)

      else
        nil
      end
    }

    scope :group_card, ->(params) {
      group(:card_id)
    }
end
