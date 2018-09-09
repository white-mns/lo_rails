class AddIndexToFacility < ActiveRecord::Migration[5.2]
  def change
    add_index :facilities, [:e_no, :set_lv, :set_col, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :facilities, :name
    add_index :facilities, :holiday
    add_index :facilities, :division
    add_index :facilities, :detail_division
    add_index :facilities, :lv
    add_index :facilities, :value
    add_index :facilities, :period
  end
end
