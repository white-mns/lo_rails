class AddRecoveryLvColumnToFacilityUse < ActiveRecord::Migration[5.2]
  def change
    add_column :facility_uses, :recovery_lv, :integer
    add_column :facility_uses, :number,      :integer
    add_index  :facility_uses, :recovery_lv
    add_index  :facility_uses, :number
  end
end
