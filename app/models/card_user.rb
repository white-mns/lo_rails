class CardUser < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :card_data,  :foreign_key => :card_id, :primary_key => :card_id, :class_name =>'CardDatum'
    
    def self.detail_group(params)
      if params["pre_detail_open"] == "on" then
        self
      else
        self.group("card_users.e_no", :card_id)
      end
    end

    def self.detail_group_count(params)
      if params["pre_detail_open"] == "on" then
        self.search(params[:q]).result.count()
      else
        self.group("card_users.e_no", :card_id).search(params[:q]).result.count().keys().size()
      end
    end
end
