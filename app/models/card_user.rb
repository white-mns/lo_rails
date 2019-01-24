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

    scope :where_old_top, ->(latest_result, show_old_top, params) {
        if show_old_top == "1" then
                sprit_params = params["old_rank_vol"].split("/")
                card_names  = []

                params_copy = {}
                params_copy[:q] = {}
                params[:q].each do |key, value|
                    if key.include?("pre_gt") || key.include?("card") || key.include?("e_no") || key.include?("p_name") then
                        params_copy[:q][key] = value
                    end
                end
               
                sprit_params.each do |split_param|
                    if split_param.include?("~") then
                        old_rank_vols = split_param.split("~")
                        old_rank_vols[0] = old_rank_vols[0].to_i
                        old_rank_vols[1] = old_rank_vols[1].to_i

                        if old_rank_vols[0] == "" || old_rank_vols[0].to_i < 1 then
                            old_rank_vols[0] = 1
                        end
                        if old_rank_vols[1] == "" || old_rank_vols[1].to_i > latest_result then
                            old_rank_vols[1] = latest_result
                        end

                        for result_no in old_rank_vols[0]..old_rank_vols[1] do
                            card_names << Hash[*CardUser.notnil().includes(:card_data).where(result_no: result_no).group_card(params).order("count desc").limit(params["old_rank_num"].to_i).search(params_copy[:q]).result.pluck("card_data.name", "COUNT(*) as count").flatten].keys
                        end
                    else
                        card_names << Hash[*CardUser.notnil().includes(:card_data).where(result_no: split_param.to_i).group_card(params).order("count desc").limit(params["old_rank_num"].to_i).search(params_copy[:q]).result.pluck("card_data.name", "COUNT(*) as count").flatten].keys
                    end
                end

            where("card_data.name IN (?)", card_names.flatten)
        end
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

    scope :to_card_user_history_graph, ->(params, column) {
        card_name = Hash[*CardDatum.pluck(:card_id, :name).flatten]
        card_lv = Hash[*CardDatum.pluck(:card_id, :lv).flatten]
        
        self.pluck(:result_no, column).inject(Hash.new(0)){|hash, a| 
            if params["group_card_name"] == "on" then
                hash[ [card_name[a[1]], a[0]] ] += 1;
            else
                hash[ [card_name[a[1]] + sprintf(" Lv%d", card_lv[a[1]]), a[0]] ] += 1;
            end
            hash}
    }

end
