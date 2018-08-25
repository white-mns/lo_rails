class CreateParameterControls < ActiveRecord::Migration[5.2]
  def change
    create_table :parameter_controls do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :cond
      t.integer :day
      t.integer :mod
      t.integer :cvp
      t.integer :pvp

      t.timestamps
    end
  end
end
