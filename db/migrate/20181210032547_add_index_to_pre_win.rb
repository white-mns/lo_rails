class AddIndexToPreWin < ActiveRecord::Migration[5.2]
  def change
    add_index :pre_wins, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_e_no'
    add_index :pre_wins, :win
    add_index :pre_wins, :draw
    add_index :pre_wins, :lose
    add_index :pre_wins, :all
  end
end
