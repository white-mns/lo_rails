class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.to_range_graph(column)
      max = self.pluck(column).max
      figure_length = max.to_s.length
      
      range = (max / 20).to_i
      floor_num = (10 ** (range.to_s.length - 1))
      range = (range / floor_num).to_i # 範囲の最上位桁の値を1,2,5のいずれかにする
      range = range <= 2 ? range : 5
      range = range * floor_num
      
      self.pluck(column).inject(Hash.new(0)){|hash, a| floor= (a/range).to_i()*range; hash[floor.to_s.rjust(figure_length) + "～" + (floor+range).to_s.rjust(figure_length)] += 1 ; hash}.sort
  end

end
