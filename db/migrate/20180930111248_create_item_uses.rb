class CreateItemUses < ActiveRecord::Migration[5.2]
  def change
    create_table :item_uses do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :i_no
      t.string :name

      t.timestamps
    end
  end
end
