class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.string :set_col
      t.integer :set_lv
      t.string :name
      t.integer :holiday
      t.integer :division
      t.integer :detail_division
      t.integer :lv
      t.integer :value
      t.integer :period

      t.timestamps
    end
  end
end
