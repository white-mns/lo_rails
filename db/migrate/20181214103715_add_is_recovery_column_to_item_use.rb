class AddIsRecoveryColumnToItemUse < ActiveRecord::Migration[5.2]
  def change
    add_column :item_uses, :recovery_lv, :integer
    add_index  :item_uses, :recovery_lv
  end
end
