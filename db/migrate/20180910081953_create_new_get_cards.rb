class CreateNewGetCards < ActiveRecord::Migration[5.2]
  def change
    create_table :new_get_cards do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :card_id
      t.integer :get_type

      t.timestamps
    end
  end
end
