module GetCardHelper
    def show_specialities(specialities)
        if !specialities then 
            return
        end

        text = ""
        specialities.each do |speciality|
            text += speciality.pgws_name.name + ","
        end
        text.chop
    end

    def speciality_style(trainings)
        if trainings && trainings.size > 1 then 
            "color:#ccc"
        end

    end
    def show_trainings(trainings)
        if !trainings then 
            return
        end

        text = ""
        trainings.each do |training|
            text += training.training_name.name + ","
        end
        text.chop
    end
end
