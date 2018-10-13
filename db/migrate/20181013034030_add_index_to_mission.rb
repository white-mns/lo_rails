class AddIndexToMission < ActiveRecord::Migration[5.2]
  def change
    add_index :missions, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :missions, :mission_id
    add_index :missions, :type
    add_index :missions, :status
    add_index :missions, :col
    add_index :missions, :lv
  end
end
