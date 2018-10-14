class CreateFacilityUses < ActiveRecord::Migration[5.2]
  def change
    create_table :facility_uses do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.string :facility_name
      t.integer :facility_effect
      t.integer :facility_lv
      t.integer :facility_e_no
      t.integer :usage
      t.integer :cost
      t.integer :success

      t.timestamps
    end
  end
end
