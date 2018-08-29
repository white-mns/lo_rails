class AddIndexToItem < ActiveRecord::Migration[5.2]
  def change
    add_index :items, [:e_no, :i_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :items, :name
    add_index :items, :equip
    add_index :items, :kind
    add_index :items, :effect
    add_index :items, :lv
    add_index :items, :potency
    add_index :items, :potency_str
    add_index :items, :precision
  end
end
