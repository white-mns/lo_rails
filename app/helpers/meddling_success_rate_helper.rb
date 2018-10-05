module MeddlingSuccessRateHelper
    def confidence_interval(success, sum, rate)
        z = 1.96
        p = (success + 2).to_f / (sum + 4)

        gosa = z * ((p * (1-p))/(sum + 4)) ** 0.5
        lower_limit = rate - gosa > 0 ? (((rate - gosa) * 100)+0.5).to_i : 0
        upper_limit = rate + gosa < 1 ? (((rate + gosa) * 100)+0.5).to_i : 100
        "(" + sprintf("%d", lower_limit)  + "％～" + sprintf("%d", upper_limit) + "％)"
    end
end
