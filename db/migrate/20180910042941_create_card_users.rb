class CreateCardUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :card_users do |t|
      t.integer :result_no
      t.integer :generate_no
      t.string :battle_page
      t.integer :e_no
      t.integer :party
      t.integer :card_id
      t.integer :success
      t.integer :control

      t.timestamps
    end
  end
end
