class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.string :invation_col
      t.integer :invation_lv
      t.string :return_col
      t.integer :return_lv

      t.timestamps
    end
  end
end
