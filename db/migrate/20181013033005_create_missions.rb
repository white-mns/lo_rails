class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :mission_id
      t.integer :type
      t.integer :status
      t.string :col
      t.integer :lv

      t.timestamps
    end
  end
end
