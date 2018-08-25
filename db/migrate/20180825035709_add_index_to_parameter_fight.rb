class AddIndexToParameterFight < ActiveRecord::Migration[5.2]
  def change
    add_index :parameter_fights, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :parameter_fights, :result_no
    add_index :parameter_fights, :generate_no
    add_index :parameter_fights, :e_no
    add_index :parameter_fights, :lv
    add_index :parameter_fights, :rank
    add_index :parameter_fights, :exp
    add_index :parameter_fights, :next
    add_index :parameter_fights, :mlp
    add_index :parameter_fights, :mfp
  end
end
