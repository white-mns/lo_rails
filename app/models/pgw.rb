class Pgw < ApplicationRecord
	belongs_to :p_name,	    :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :pgws_name,  :foreign_key => :pgws_name_id,    :primary_key => :proper_id, :class_name => 'ProperName'
    
  def self.pgws_type(type, params)
    self.includes(:p_name, :pgws_name).where(pgws_type: type).search(params[:q]).result
  end

  def self.to_pgws_graph(column)
      pgws_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
      self.pluck(column).inject(Hash.new(0)){|hash, a| hash[pgws_name[a]] += 1 ; hash}.sort_by{ |k, v| v}
  end

  def self.to_potential_graph(column)
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
      self.pluck(column).inject(Hash.new(0)){|hash, a| hash[japanese_name[pgws_name[a]]] += 1 ; hash}.sort_by{ |k, v| v}
  end
end
