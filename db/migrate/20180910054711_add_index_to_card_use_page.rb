class AddIndexToCardUsePage < ActiveRecord::Migration[5.2]
  def change
    add_index :card_use_pages, [:battle_page, :party, :result_no, :generate_no], :unique => false, :name => 'resultno_and_battle_page'
  end
end
