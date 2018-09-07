class AddIndexToGetCard < ActiveRecord::Migration[5.2]
  def change
    add_index :get_cards, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :get_cards, :name
    add_index :get_cards, :card_id
    add_index :get_cards, :get_type
  end
end
