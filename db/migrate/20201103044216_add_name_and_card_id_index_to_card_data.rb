class AddNameAndCardIdIndexToCardData < ActiveRecord::Migration[6.0]
  def change
    add_index :card_data, [:name, :card_id], :unique => false, :name => 'name_and_cardid'
  end
end
