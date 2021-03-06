class AddIndexToParameterControl < ActiveRecord::Migration[5.2]
  def change
    add_index :parameter_controls, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :parameter_controls, :cond
    add_index :parameter_controls, :day
    add_index :parameter_controls, :mod
    add_index :parameter_controls, :cvp
    add_index :parameter_controls, :pvp
  end
end
