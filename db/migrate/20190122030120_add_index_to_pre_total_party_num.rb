class AddIndexToPreTotalPartyNum < ActiveRecord::Migration[5.2]
  def change
    add_index :pre_total_party_nums, [:result_no, :count_type, :e_no], :unique => false, :name => 'resultno_counttype'
    add_index :pre_total_party_nums, [:result_no, :e_no, :count_type], :unique => false, :name => 'resultno_eno'
    add_index :pre_total_party_nums, :e_no
    add_index :pre_total_party_nums, :count_type
    add_index :pre_total_party_nums, :party_num
  end
end
