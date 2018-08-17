class AddIndexToName < ActiveRecord::Migration[5.2]
  def change
    add_index :names, [:e_no, :result_no, :generate_no], :unique => false, :name => 'unique_eno'
  end
end
