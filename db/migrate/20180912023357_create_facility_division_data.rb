class CreateFacilityDivisionData < ActiveRecord::Migration[5.2]
  def change
    create_table :facility_division_data do |t|
      t.integer :division_id
      t.integer :detail
      t.integer :major

      t.timestamps
    end
  end
end
