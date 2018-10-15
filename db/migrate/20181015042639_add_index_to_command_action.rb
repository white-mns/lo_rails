class AddIndexToCommandAction < ActiveRecord::Migration[5.2]
  def change
    add_index :command_actions, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :command_actions, :act
    add_index :command_actions, :s_no
    add_index :command_actions, :timing
    add_index :command_actions, :gowait
    add_index :command_actions, :card_id
  end
end
