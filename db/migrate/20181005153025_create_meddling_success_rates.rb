class CreateMeddlingSuccessRates < ActiveRecord::Migration[5.2]
  def change
    create_table :meddling_success_rates do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :card_id
      t.integer :chain
      t.integer :success
      t.integer :miss
      t.integer :no_apply
      t.integer :sum
      t.integer :rate

      t.timestamps
    end
  end
end
