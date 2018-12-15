class CreateDices < ActiveRecord::Migration[5.2]
  def change
    create_table :dices do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :number
      t.integer :dice
      t.integer :use_item

      t.timestamps
    end
  end
end
