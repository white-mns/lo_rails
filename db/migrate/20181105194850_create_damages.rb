class CreateDamages < ActiveRecord::Migration[5.2]
  def change
    create_table :damages do |t|
      t.integer :result_no
      t.integer :generate_no
      t.string :battle_page
      t.integer :e_no
      t.integer :party
      t.integer :card_id
      t.integer :chain
      t.integer :target_e_no
      t.integer :target_party
      t.integer :act_type
      t.integer :element
      t.integer :damage
      t.integer :is_weak
      t.integer :is_critical
      t.integer :is_clean
      t.integer :is_vanish
      t.integer :is_absorb

      t.timestamps
    end
  end
end
