class AddIndexToCardUser < ActiveRecord::Migration[5.2]
  def change
    add_index :card_users, [:battle_page, :party, :e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_battle_page'
    add_index :card_users, :card_id
    add_index :card_users, :success
    add_index :card_users, :control
  end
end
