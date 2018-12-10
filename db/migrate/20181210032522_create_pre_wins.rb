class CreatePreWins < ActiveRecord::Migration[5.2]
  def change
    create_table :pre_wins do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :win
      t.integer :draw
      t.integer :lose
      t.integer :all

      t.timestamps
    end
  end
end
