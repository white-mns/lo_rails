class CreateDamageBuffers < ActiveRecord::Migration[5.2]
  def change
    create_table :damage_buffers do |t|
      t.integer :result_no
      t.integer :generate_no
      t.string :battle_page
      t.integer :act_id
      t.integer :e_no
      t.integer :buffer_id
      t.integer :lv
      t.integer :value

      t.timestamps
    end
  end
end
