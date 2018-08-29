class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :i_no
      t.string :name
      t.integer :equip
      t.integer :kind
      t.integer :effect
      t.integer :lv
      t.integer :potency
      t.string :potency_str
      t.integer :precision

      t.timestamps
    end
  end
end
