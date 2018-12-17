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

    def showBufferLv(buffer)
        if !buffer then 
            return
        end

        if buffer.lv > 0 then
            haml_concat "Lv"
        end

        haml_concat buffer.lv
        return nil
    end

    def showReinforcing(buffer)
        if !buffer || buffer.lv == 0 then 
            return
        end

        haml_concat buffer.buffer.name.delete("フィールド")
        haml_concat "Lv"
        haml_concat buffer.lv

        return nil
    end

    def showConversion(buffer)
        if !buffer then 
            return
        end

        haml_concat buffer.buffer.name.delete("フィールド")

        return nil
    end

end
