class CreateCommandActions < ActiveRecord::Migration[5.2]
  def change
    create_table :command_actions do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :act
      t.integer :s_no
      t.integer :timing
      t.integer :gowait
      t.integer :card_id

      t.timestamps
    end
  end
end
