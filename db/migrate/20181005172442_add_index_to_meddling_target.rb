class AddIndexToMeddlingTarget < ActiveRecord::Migration[5.2]
  def change
    add_index :meddling_targets, [:e_no, :card_id, :chain, :result_no, :generate_no], :unique => false, :name => 'resultno_eno_cardid_chain'
    add_index :meddling_targets, :target_id
    add_index :meddling_targets, :count
  end
end
