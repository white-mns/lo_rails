class AddColumunToCardData < ActiveRecord::Migration[5.2]
  def change
    add_column :card_data, :lpfp, :integer
    add_index  :card_data, :lpfp
  end
end
