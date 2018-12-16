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
end
