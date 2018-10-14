class AddIndexToFacilityUse < ActiveRecord::Migration[5.2]
  def change
    add_index :facility_uses, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :facility_uses, :facility_name
    add_index :facility_uses, :facility_effect
    add_index :facility_uses, :facility_lv
    add_index :facility_uses, :facility_e_no
    add_index :facility_uses, :usage
    add_index :facility_uses, :cost
    add_index :facility_uses, :success
  end
end
