class CreateCardUsePages < ActiveRecord::Migration[5.2]
  def change
    create_table :card_use_pages do |t|
      t.integer :result_no
      t.integer :generate_no
      t.string :battle_page
      t.integer :party
      t.string :use_cards

      t.timestamps
    end
  end
end
