class AddColumnTurnToCardUser < ActiveRecord::Migration[5.2]
  def change
    add_column :card_users, :turn, :integer
    add_index  :card_users, :turn
    add_index :card_users, [:result_no, :e_no], :unique => false, :name => 'resultno'
  end
end
