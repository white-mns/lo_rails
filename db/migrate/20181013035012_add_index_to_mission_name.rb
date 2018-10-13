class AddIndexToMissionName < ActiveRecord::Migration[5.2]
  def change
    add_index :mission_names, :mission_id
    add_index :mission_names, :name
  end
end
