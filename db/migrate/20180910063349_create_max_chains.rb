class CreateMaxChains < ActiveRecord::Migration[5.2]
  def change
    create_table :max_chains do |t|
      t.integer :result_no
      t.integer :generate_no
      t.string :battle_page
      t.integer :party
      t.integer :max_chain

      t.timestamps
    end
  end
end
