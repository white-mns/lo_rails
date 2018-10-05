class CreateMeddlingTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :meddling_targets do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :card_id
      t.integer :chain
      t.integer :target_id
      t.integer :count

      t.timestamps
    end
  end
end
