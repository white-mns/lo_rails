class CreateMissionNames < ActiveRecord::Migration[5.2]
  def change
    create_table :mission_names do |t|
      t.integer :mission_id
      t.string :name

      t.timestamps
    end
  end
end
