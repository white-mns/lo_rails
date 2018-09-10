class CreateNewCardUses < ActiveRecord::Migration[5.2]
  def change
    create_table :new_card_uses do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :card_id

      t.timestamps
    end
  end
end
