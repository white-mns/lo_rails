module DamageHelper
    def showPreDamage(pre_damage)
        if !pre_damage then 
            return
        end
        if pre_damage > 0 then
            haml_tag :span, class: "xl" do
                haml_concat "○"
            end
        end
        if pre_damage > 1 then
            haml_concat pre_damage
        end

        return nil
    end

    def showLine(line)
        if !line then 
            return
        end

        if line == 0 then
            return "前"
        elsif line == 1 then
            return "中"
        elsif line == 2 then
            return "後"
        end

        return nil
    end
end
