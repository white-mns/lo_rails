class AddIndexToDamage < ActiveRecord::Migration[5.2]
  def change
    add_index :damages, [:battle_page, :e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_battle_page'
    add_index :damages, :party
    add_index :damages, :card_id
    add_index :damages, :chain
    add_index :damages, :target_e_no
    add_index :damages, :target_party
    add_index :damages, :act_type
    add_index :damages, :element
    add_index :damages, :damage
    add_index :damages, :is_weak
    add_index :damages, :is_critical
    add_index :damages, :is_clean
    add_index :damages, :is_vanish
    add_index :damages, :is_absorb
  end
end
