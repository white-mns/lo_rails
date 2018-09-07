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
