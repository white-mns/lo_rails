class AddIndexToCardData < ActiveRecord::Migration[5.2]
  def change
    add_index :card_data, :card_id
    add_index :card_data, :name
    add_index :card_data, :lv
    add_index :card_data, :lp
    add_index :card_data, :fp
  end
end
