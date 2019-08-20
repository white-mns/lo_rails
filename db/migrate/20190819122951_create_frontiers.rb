class CreateFrontiers < ActiveRecord::Migration[5.2]
  def change
    create_table :frontiers do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.string :col
      t.integer :lv

      t.timestamps
    end
  end
end
