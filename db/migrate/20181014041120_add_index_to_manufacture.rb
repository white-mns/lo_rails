class AddIndexToManufacture < ActiveRecord::Migration[5.2]
  def change
    add_index :manufactures, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :manufactures, :facility_name
    add_index :manufactures, :facility_effect
    add_index :manufactures, :facility_lv
    add_index :manufactures, :facility_e_no
    add_index :manufactures, :item_name
    add_index :manufactures, :usage
    add_index :manufactures, :cost
    add_index :manufactures, :kind
    add_index :manufactures, :effect
    add_index :manufactures, :effect_lv
    add_index :manufactures, :potency
    add_index :manufactures, :precision
    add_index :manufactures, :total
  end
end
