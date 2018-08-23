class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :slash
      t.integer :thrust
      t.integer :stroke
      t.integer :shot
      t.integer :guard
      t.integer :dance
      t.integer :theft
      t.integer :cooking
      t.integer :technology
      t.integer :movement
      t.integer :chemistry
      t.integer :arithmetic
      t.integer :firee
      t.integer :theology
      t.integer :life
      t.integer :demonology
      t.integer :geography
      t.integer :astronomy
      t.integer :fengshui
      t.integer :psychology
      t.integer :music
      t.integer :curse
      t.integer :illusion
      t.integer :trick

      t.timestamps
    end
  end
end
