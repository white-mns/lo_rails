class AddIndexToNewGetCard < ActiveRecord::Migration[5.2]
  def change
    add_index :new_get_cards, [:result_no, :generate_no], :unique => false, :name => 'resultno_and_generateno'
    add_index :new_get_cards, :card_id
    add_index :new_get_cards, :get_type
  end
end
