class AddIndexToParameterDevelopment < ActiveRecord::Migration[5.2]
  def change
    add_index :parameter_developments, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_e_no'
    add_index :parameter_developments, :lv
    add_index :parameter_developments, :rank
    add_index :parameter_developments, :mlp
    add_index :parameter_developments, :mfp
    add_index :parameter_developments, :cond
  end
end
