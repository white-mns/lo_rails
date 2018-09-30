class AddIndexToItemUse < ActiveRecord::Migration[5.2]
  def change
    add_index :item_uses, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :item_uses, :i_no
    add_index :item_uses, :name
  end
end
