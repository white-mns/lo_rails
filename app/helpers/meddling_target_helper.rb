module MeddlingTargetHelper
    def meddling_target_link(result_no, e_no, card_data)
        if !card_data then
            return
        end
        path  = card_users_path + "?result_no_form=" + sprintf("%d", result_no) 
        path += (e_no > 0) ? "&e_no_form=" + sprintf("%d", e_no) : ""
        path += "&effect_form=\"" + card_data.name + "\"&lv_form=" + sprintf("%d", card_data.lv) + "&pre_detail_open=on"
        link_to "発動結果一覧", path
    end
end
