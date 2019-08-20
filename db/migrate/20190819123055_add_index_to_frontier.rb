class AddIndexToFrontier < ActiveRecord::Migration[5.2]
  def change
    add_index :frontiers, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_e_no'
    add_index :frontiers, :col
    add_index :frontiers, :lv
  end
end
