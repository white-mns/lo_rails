class AddIndexToNewItemUse < ActiveRecord::Migration[5.2]
  def change
    add_index :new_item_uses, [:result_no, :generate_no], :unique => false, :name => 'resultno_and_generateno'
    add_index :new_item_uses, :name
  end
end
