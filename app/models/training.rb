class Training < ApplicationRecord

    def self.ransackable_attributes(auth_object = nil)
      column_names
    end

    def self.ransackable_associations(auth_object = nil)
      Array(reflect_on_all_associations).map(&:name).map(&:to_s)
    end

	belongs_to :p_name,	       :foreign_key => [:e_no, :result_no, :generate_no], :primary_key => [:e_no, :result_no, :generate_no], :class_name => 'Name'
	belongs_to :training_name, :foreign_key => :training, :primary_key => :proper_id, :class_name => 'ProperName'
  
    scope :training_type, ->(type)   { includes(:p_name, :training_name).where(training_type: type) }
    scope :search_result, ->(params) { search(params[:q]).result }
    
    scope :to_training_graph, ->(column) {
        training_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
        self.pluck(column).inject(Hash.new(0)){|hash, a| hash[training_name[a]] += 1 ; hash}.sort_by{ |k, v| v}
    }

    scope :to_training_rate_graph, ->(column) {
        training_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
        
        training_all_count = self.count()
        training_hash = self.pluck(column).inject(Hash.new(0)){|hash, a| hash[training_name[a]] += 1 ; hash}
        
        training_hash.each{ |key, value|
            training_hash[key] = (value.to_f * 100 / training_all_count.to_f).floor(1)
        }
        training_hash.sort_by{ |k, v| v}
    }

    scope :to_training_history_graph, ->(params, column) {
        training_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
        
        training_hash = self.pluck(:result_no, column).inject(Hash.new(0)){|hash, a| hash[ [training_name[a[1]], a[0]] ] += 1;hash}
        
        result_hash = Hash.new(0)
        training_hash.each{ |key, value|
            set_result_hash(key, result_hash, training_hash, params["training_graph_form"])
        }

        if params["training_graph_form"] && result_hash.size > 0 then
            result_hash
        else
            training_hash
        end
    }

    scope :to_training_history_rate_graph, ->(params, column) {
        training_name = Hash[*ProperName.pluck(:proper_id, :name).flatten]
        
        training_all_count = self.group(:result_no).count()
        training_hash = self.pluck(:result_no, column).inject(Hash.new(0)){|hash, a| hash[ [training_name[a[1]], a[0]] ] += 1;hash}
        
        result_hash = Hash.new(0)
        training_hash.each{ |key, value|
            training_hash[key] = (value.to_f * 100 / training_all_count[key[1]].to_f).floor(1)
        
            set_result_hash(key, result_hash, training_hash, params["training_graph_form"])
        }

        if params["training_graph_form"] && result_hash.size > 0 then
            result_hash
        else
            training_hash
        end
    }

    def self.set_result_hash(key, result_hash, training_hash, form_text)
        if form_text.blank? then
            result_hash = training_hash
        end

        if form_text then
            texts_or = (form_text.match(/\//)) ? form_text.split("/") : [form_text]
            for text_or in texts_or do
                if text_or then
                    if key[0].match(/#{text_or}/) then
                        result_hash[key] = training_hash[key]
                    end
                end
            end
        end
    end
end
