class Pgw < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :pgws_name,  :foreign_key => :pgws_name_id,    :primary_key => :proper_id, :class_name => 'ProperName'
    
    scope :pgws_type, -> (type, params){
        includes(:p_name, :pgws_name).where(pgws_type: type).search(params[:q]).result
    }

    scope :to_pgws_graph, -> (column) {
        pgws_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
        pluck(column).inject(Hash.new(0)){|hash, a| hash[pgws_name[a]] += 1 ; hash}.sort_by{ |k, v| v}
    }

    scope :to_potential_graph, ->(column) {
        pgws_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
        japanese_name = {
            "THE FOOL" => "愚者",
            "THE MAGICIAN" => "魔術師",
            "THE HIGH PRIESTESS" => "女教皇",
            "THE EMPRESS" => "女帝",
            "THE EMPEROR" => "皇帝",
            "THE HIEROPHANT" => "法王",
            "THE LOVERS" => "友愛",
            "THE CHARIOT" => "戦車",
            "STRENGTH" => "力",
            "THE HERMIT" => "隠者",
            "WHEEL OF FORTUNE" => "運命",
            "JUSTICE" => "正義",
            "THE HANGED MAN" => "吊者",
            "DEATH" => "死",
            "TEMPERANCE" => "節制",
            "THE DEVIL" => "悪魔",
            "THE TOWER" => "塔",
            "THE STAR" => "星",
            "THE MOON" => "月",
            "THE SUN" => "太陽",
            "JUDGEMENT" => "審判",
            "THE WORLD" => "世界",
        }
        pluck(column).inject(Hash.new(0)){|hash, a| hash[japanese_name[pgws_name[a]]] += 1 ; hash}.sort_by{ |k, v| v}
    }
end
