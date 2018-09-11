module NewGetCardHelper
    def new_get_card_to_get_card_link(result_no, name, lv, get_type)
        if get_type != 3
            get_type_text =  ""
            get_type_text =  "&is_get_type_create=on" if get_type == 1
            get_type_text =  "&is_get_type_drop=on"   if get_type == 2
            link_to "全取得カード一覧", get_cards_path + "?result_no_form=" + sprintf("%d",result_no) + "&effect_form=\"" + name + "\"&lv_form=" + sprintf("%d", lv) + get_type_text 
        end
    end
end
