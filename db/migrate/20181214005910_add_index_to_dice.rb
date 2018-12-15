class AddIndexToDice < ActiveRecord::Migration[5.2]
  def change
    add_index :dices, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_e_no'
    add_index :dices, :number
    add_index :dices, :dice
    add_index :dices, :use_item
  end
end
