class CreateCharacteristics < ActiveRecord::Migration[5.2]
  def change
    create_table :characteristics do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :str
      t.integer :vit
      t.integer :int
      t.integer :mnd
      t.integer :tec
      t.integer :eva

      t.timestamps
    end
  end
end
