class AddIndexToBug < ActiveRecord::Migration[5.2]
  def change
    add_index :bugs, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_eno'
    add_index :bugs, :bug_e_no
    add_index :bugs, :lv
  end
end
