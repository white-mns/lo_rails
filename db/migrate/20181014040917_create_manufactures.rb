class CreateManufactures < ActiveRecord::Migration[5.2]
  def change
    create_table :manufactures do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.string :facility_name
      t.integer :facility_effect
      t.integer :facility_lv
      t.integer :facility_e_no
      t.string :item_name
      t.integer :usage
      t.integer :cost
      t.integer :kind
      t.integer :effect
      t.integer :effect_lv
      t.integer :potency
      t.integer :precision
      t.integer :total

      t.timestamps
    end
  end
end
