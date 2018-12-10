module BugHelper
    def bug_lv_border(bug)
        if !bug then 
            return
        end

        border_style = ""
        if bug.result_no != bug.lv && @show_detail_development == "1" && @show_detail_pre == "1" then
           border_style = "0.2rem red solid"
        end

        "border-left: " + border_style;
    end
end
