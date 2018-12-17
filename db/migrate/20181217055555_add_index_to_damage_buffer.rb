class AddIndexToDamageBuffer < ActiveRecord::Migration[5.2]
  def change
    add_index :damage_buffers, [:battle_page, :act_id, :e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_battle_page_and_act_id'
    add_index :damage_buffers, :buffer_id
    add_index :damage_buffers, :lv
    add_index :damage_buffers, :value
  end
end
