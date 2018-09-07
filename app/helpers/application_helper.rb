module ApplicationHelper
    def character_link(e_no)
        file_name = sprintf("%d",e_no)
        link_to " 結果", "http://ykamiya.ciao.jp/result/result_chara/result_Eno"+file_name+".html", :target => "_blank"
    end
    
    def character_old_link(last_result_no, e_no, result_no)
        if result_no < last_result_no
            file_name = sprintf("%d",e_no)
            result_no_text = sprintf("%d",result_no)
            link_to " 過去結果", "http://ykamiya.ciao.jp/result"+result_no_text+"/result_chara/result_Eno"+file_name+".html", :target => "_blank"
        end
    end
end
