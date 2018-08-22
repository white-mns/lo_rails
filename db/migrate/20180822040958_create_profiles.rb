class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.string :nickname
      t.integer :tone
      t.string :first
      t.string :second

      t.timestamps
    end
  end
end
