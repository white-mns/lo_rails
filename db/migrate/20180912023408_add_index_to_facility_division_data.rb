class AddIndexToFacilityDivisionData < ActiveRecord::Migration[5.2]
  def change
    add_index :facility_division_data, :division_id
    add_index :facility_division_data, :detail
    add_index :facility_division_data, :major
  end
end
