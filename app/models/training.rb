class Training < ApplicationRecord
	belongs_to :p_name,	       :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :training_name, :foreign_key => :training, :primary_key => :proper_id, :class_name => 'ProperName'
  
    def self.training_type(type, params)
      self.includes(:p_name, :training_name).where(training_type: type).search(params[:q]).result
    end
    
    def self.to_training_graph(column)
      training_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
      self.pluck(column).inject(Hash.new(0)){|hash, a| hash[training_name[a]] += 1 ; hash}.sort_by{ |k, v| v}
    end

    def self.to_training_rate_graph(column)
      training_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]

      training_all_count = self.count()
      training_hash = self.pluck(column).inject(Hash.new(0)){|hash, a| hash[training_name[a]] += 1 ; hash}

      training_hash.each{ |key, value|
          training_hash[key] = (value.to_f * 100 / training_all_count.to_f).floor(1)
      }
      training_hash.sort_by{ |k, v| v}
    end
end
