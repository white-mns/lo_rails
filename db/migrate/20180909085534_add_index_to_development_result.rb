class AddIndexToDevelopmentResult < ActiveRecord::Migration[5.2]
  def change
    add_index :development_results, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :development_results, :development_result
    add_index :development_results, :bellicose
    add_index :development_results, :party_num
  end
end
