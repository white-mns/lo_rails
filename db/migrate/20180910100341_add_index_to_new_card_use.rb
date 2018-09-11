class AddIndexToNewCardUse < ActiveRecord::Migration[5.2]
  def change
    add_index :new_card_uses, [:result_no, :generate_no], :unique => false, :name => 'resultno_and_generateno'
    add_index :new_card_uses, :card_id
  end
end
