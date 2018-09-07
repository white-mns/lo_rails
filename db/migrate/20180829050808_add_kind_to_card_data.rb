class AddKindToCardData < ActiveRecord::Migration[5.2]
  def change
    add_column :card_data, :kind, :integer
    add_index  :card_data, :kind
  end
end
