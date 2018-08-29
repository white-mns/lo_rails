class CreateCardData < ActiveRecord::Migration[5.2]
  def change
    create_table :card_data do |t|
      t.integer :card_id
      t.string :name
      t.integer :lv
      t.integer :lp
      t.integer :fp

      t.timestamps
    end
  end
end
