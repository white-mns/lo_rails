class CreateNewItemUses < ActiveRecord::Migration[5.2]
  def change
    create_table :new_item_uses do |t|
      t.integer :result_no
      t.integer :generate_no
      t.string :name

      t.timestamps
    end
  end
end
