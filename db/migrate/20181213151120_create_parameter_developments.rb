class CreateParameterDevelopments < ActiveRecord::Migration[5.2]
  def change
    create_table :parameter_developments do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :lv
      t.integer :rank
      t.integer :mlp
      t.integer :mfp
      t.integer :cond

      t.timestamps
    end
  end
end
