class AddIndexToProfile < ActiveRecord::Migration[5.2]
  def change
    add_index :profiles, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :profiles, :tone
  end
end
