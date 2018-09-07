class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :s_no
      t.string :name
      t.integer :possession
      t.integer :kind
      t.integer :card_id

      t.timestamps
    end
  end
end
