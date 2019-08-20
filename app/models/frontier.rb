class Frontier < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'

    scope :for_group_select, ->(action_name, params) {
        select("*").
        select("COUNT(result_no) AS frontier_sum,
               GROUP_CONCAT(col,' - ',lv SEPARATOR '、') AS frontier_areas")
    }

    scope :groups, ->(action_name, params) {
        group_e_no(params)
    }
 
    scope :group_e_no, ->(params) {
        group("frontiers.e_no")
    }

    scope :having_order, ->(params) {
        ex_sorts = {"frontier_sum desc" => 1}

        if !params[:q][:s] then
            params["ex_sort_text"] = "frontier_sum desc"
            return order("frontier_sum desc")

        elsif ex_sorts.has_key?(params[:q][:s]) then
            sort = params[:q][:s]
            params[:q].delete(:s)
            params["ex_sort"] = "on"
            params["ex_sort_text"] = sort
            return order(sort)

        else
            params["ex_sort_text"] = ""

        end
        nil
    }
end
