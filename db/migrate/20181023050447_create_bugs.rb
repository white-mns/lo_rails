class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :bug_e_no
      t.integer :lv

      t.timestamps
    end
  end
end
