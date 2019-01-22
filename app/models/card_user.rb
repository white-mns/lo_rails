class CardUser < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :pre_gt0, -> { where(count_type: 20)},:foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'PreTotalPartyNum'
	belongs_to :pre_gt1, -> { where(count_type: 21)},:foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'PreTotalPartyNum'
	belongs_to :pre_gt2, -> { where(count_type: 22)},:foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'PreTotalPartyNum'
	belongs_to :pre_gt3, -> { where(count_type: 23)},:foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'PreTotalPartyNum'
	belongs_to :card_data,  :foreign_key => :card_id, :primary_key => :card_id, :class_name =>'CardDatum'
 
    scope :pre_includes, ->(params) {
        pre_gt0_includes(params).
        pre_gt1_includes(params).
        pre_gt2_includes(params).
        pre_gt3_includes(params)
    }

    scope :pre_gt0_includes, ->(params) {
        if params["pre_gt0_form"] then includes(:pre_gt0) end
    }

    scope :pre_gt1_includes, ->(params) {
        if params["pre_gt1_form"] then includes(:pre_gt1) end
    }

    scope :pre_gt2_includes, ->(params) {
        if params["pre_gt2_form"] then includes(:pre_gt2) end
    }

    scope :pre_gt3_includes, ->(params) {
        if params["pre_gt3_form"] then includes(:pre_gt3) end
    }

    scope :having_order, ->(params) {
        if !params[:q][:s] then
            return order("count desc")

        elsif params[:q][:s].include?(" ") then
            sort = params[:q][:s]
            if sort.split(" ")[0] == "user_num"  ||
               sort.split(" ")[0] == "party_num" ||
               sort.split(" ")[0] == "count" then
                params[:q].delete(:s)
                return order(sort)
            end
        end
        nil
    }

    scope :for_graph_select, ->(action_name, params) {
        if action_name != "index" then
            select("*").
            select("COUNT(*) AS count,
                    COUNT(DISTINCT card_users.e_no) AS user_num,
                    COUNT(DISTINCT card_users.party) AS party_num")
        end
    }

    scope :all_group, ->(action_name, params) {
      group("card_users.result_no").
      group_e_no(action_name).
      group_turn(params).
      group_battle_page(params).
      group_card(params)
    }

    scope :group_e_no, ->(action_name) {
        if action_name == "index" then group("card_users.e_no") end
    }

    scope :group_turn, ->(params) {
        if params["group_turn"] then
            group(:turn)
        end
    }

    scope :group_battle_page, ->(params) {
      if params["pre_detail_open"] == "on" then
        group(:battle_page).group(:party)

      else
        nil
      end
    }

    scope :group_card, ->(params) {
      if params["group_card_name"] == "on" then
        joins(:card_data).group("card_data.name")

      else
        includes(:card_data).group(:card_id)
      end
    }
end
