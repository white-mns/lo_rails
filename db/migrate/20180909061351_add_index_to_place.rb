class AddIndexToPlace < ActiveRecord::Migration[5.2]
  def change
    add_index :places, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :places, :invation_col
    add_index :places, :invation_lv
    add_index :places, :return_col
    add_index :places, :return_lv
  end
end
