class CreateParameterFights < ActiveRecord::Migration[5.2]
  def change
    create_table :parameter_fights do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :lv
      t.integer :rank
      t.integer :exp
      t.integer :next
      t.integer :mlp
      t.integer :mfp

      t.timestamps
    end
  end
end
