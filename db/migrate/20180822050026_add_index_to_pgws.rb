class AddIndexToPgws < ActiveRecord::Migration[5.2]
  def change
    add_index :pgws, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :pgws, :pgws_type
    add_index :pgws, :pgws_name_id
  end
end
