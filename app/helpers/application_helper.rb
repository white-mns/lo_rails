module ApplicationHelper
    def page_title
        title = "LastOrder#Aデータ小屋"
        title = @page_title + " | " + title if @page_title
        title
    end

    def p_name_text(e_no, p_name)
        e_no_text = "(" + sprintf("%d",e_no) + ")"
        if p_name then
            p_name.name.html_safe + e_no_text
        else
            e_no_text
        end
    end

    def character_link(e_no)
        if e_no <= 0 then return end

        file_name = sprintf("%d",e_no)
        link_to " 結果", "http://ykamiya.ciao.jp/result/result_chara/result_Eno"+file_name+".html", :target => "_blank"
    end
    
    def character_old_link(latest_result_no, e_no, result_no)
        if e_no <= 0 then return end
        if result_no == latest_result_no then return end

        file_name = sprintf("%d",e_no)
        result_no_text = sprintf("%d",result_no)
        result_no_text = (result_no == 4) ? result_no_text + "r" : result_no_text;
        link_to " 過去結果", "http://ykamiya.ciao.jp/result"+result_no_text+"/result_chara/result_Eno"+file_name+".html", :target => "_blank"
    end
    
    def character_command_link(e_no)
        file_name = sprintf("%d",e_no)
        link_to " 最新設定", "http://ykamiya.ciao.jp/cgi-bin/command.cgi?En_input="+file_name, :target => "_blank"
    end
    
    def character_command_old_link(latest_result_no, e_no, result_no)
        if e_no      <= 0 then return end
        if result_no <= 5 then return end
        result_no_text = (result_no != latest_result_no) ? sprintf("%d",result_no) : "";
        file_name = sprintf("%d",e_no)
        link_to " 更新時設定", "http://ykamiya.ciao.jp/result"+result_no_text+"/result_com/result_com"+file_name+".html", :target => "_blank"
    end
    
    def battle_link(latest_result_no, battle_page, result_no)
        if result_no != latest_result_no then return end

        file_name = battle_page.gsub(/ VS /, "-")
        link_to " 結果", "http://ykamiya.ciao.jp/result/result_pre/result_Pno"+file_name+".html", :target => "_blank"
    end
    
    def battle_old_link(latest_result_no, battle_page, result_no)
        if result_no == latest_result_no then return end

        file_name = battle_page.gsub(/ VS /, "-")
        result_no_text = sprintf("%d",result_no)
        result_no_text = (result_no == 4) ? result_no_text + "r" : result_no_text;
        link_to " 過去結果", "http://ykamiya.ciao.jp/result"+result_no_text+"/result_pre/result_Pno"+file_name+".html", :target => "_blank"
    end
    
    def search_submit_button()
        haml_tag :button, class: "btn submit", type: "submit" do
            haml_concat fa_icon "search", text: "検索する"
        end
    end

    def help_icon()
        haml_concat fa_icon "question-circle"
    end

    def act_desc(is_opened)
        desc        = is_opened ? "（クリックで閉じます）" : "（クリックで開きます）"
        desc_closed = is_opened ? "（クリックで開きます）" : "（クリックで閉じます）"

        haml_tag :span, class: "act_desc" do
            haml_concat desc
        end

        haml_tag :span, class: "act_desc closed" do
            haml_concat desc_closed
        end
    end

    def act_icon(is_opened)
        icon        = is_opened ? "times" : "plus"
        icon_closed = is_opened ? "plus"  : "times"

        haml_tag :span, class: "act_desc" do
            haml_concat fa_icon icon, class: "fa-lg"
        end

        haml_tag :span, class: "act_desc closed" do
            haml_concat fa_icon icon_closed, class: "fa-lg"
        end
    end

    def td_form(f, form_params, placeholders, class_name: nil, colspan: nil, label: nil, params_name: nil, placeholder: nil, checkboxes: nil, label_td_class_name: nil)
        haml_tag :td, class: label_td_class_name do
            if label then
                haml_concat f.label params_name.to_sym, label
            end
        end

        # テキストフォームの描画
        if !class_name.nil? && !params_name.nil?  then
            td_text_form(f, form_params, placeholders, class_name: class_name, colspan: colspan, params_name: params_name, placeholder: placeholder)
        end

        # チェックボックス選択フォームの描画
        if !checkboxes.nil?  then
            td_text_checkbox(f, form_params, placeholders, class_name: class_name, colspan: colspan, checkboxes: checkboxes)
        end
    end

    def td_text_form(f, form_params, placeholders, class_name: nil, colspan: nil, params_name: nil, placeholder: nil)
        haml_tag :td, class: class_name, colspan: colspan do
            haml_concat text_field_tag params_name.to_sym, form_params[params_name], placeholder: placeholders[placeholder]
        end
    end

    def td_text_checkbox(f, form_params, placeholders, class_name: nil, colspan: nil, checkboxes: [])
        haml_tag :td, class: class_name, colspan: colspan do
            checkboxes.each do |hash|
                # チェックボックスの描画
                if !hash[:params_name].nil? then
                    haml_tag :span, class: hash[:class_name] do
                        haml_concat check_box_tag hash[:params_name].to_sym, form_params[hash[:params_name]], form_params[hash[:params_name]]
                        haml_concat label_tag hash[:params_name].to_sym, hash[:label]
                    end
                end

                # 改行指定
                if hash[:br] then
                    haml_tag :br
                end
            end
        end
    end

    def tbody_toggle(form_params, params_name: nil, label: {open: "", close: ""}, act_desc: nil, base_first: false)
        haml_tag :tbody, class: "tbody_toggle pointer"do
            haml_tag :tr do
                haml_tag :td, colspan: 5 do
                    if base_first then
                        haml_concat hidden_field_tag :base_first, form_params["base_first"]
                    end

                    haml_concat hidden_field_tag params_name.to_sym, form_params[params_name]

                    act_icon(false)

                    haml_concat label_tag params_name.to_sym, "　" + label[:open],  class: "act_desc"
                    haml_concat label_tag params_name.to_sym, "　" + label[:close], class: "act_desc closed"
                    if act_desc then
                        haml_tag :div, class: "act_desc" do
                           haml_concat "　" + act_desc
                        end
                    end
                end
            end
        end
    end

    def render_subjects(object, subjects, params, open, marked)
        subjects.each do |subject, subject_name|
            render_subject_td(object, subject, params, open, marked)
        end
    end

    def render_subject_td(object, subject, params, open, marked)
        if params["min_0_hidden"] && open[subject] == 0
        else
          if params["min_0_gray"] && open[subject] == 0 then
            haml_tag :td, style: "background-color: #aaa;" do
              render_subject_span(object, subject, params, open)
            end
          elsif marked && marked[subject] == "on" then
            haml_tag :td, style: "background-color: #faa;" do
              render_subject_span(object, subject, params, open)
            end
          else
            haml_tag :td do
              render_subject_span(object, subject, params, open)
            end
          end
        end
    end
    
    def render_subject_span(object, subject,  params, open)
        if object && object[subject] == 0
          haml_tag :span, style: "color: #ccc;" do
            render_subject(object, subject, params, open)
          end
        else
          haml_tag :span do
            render_subject(object, subject, params, open)
          end
        end
    end

    def render_subject(object, subject, params, open)
        if object
            haml_concat object[subject]
        end
    end
end
