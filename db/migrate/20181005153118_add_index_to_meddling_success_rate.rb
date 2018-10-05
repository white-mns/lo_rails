class AddIndexToMeddlingSuccessRate < ActiveRecord::Migration[5.2]
  def change
    add_index :meddling_success_rates, [:e_no, :card_id, :chain, :result_no, :generate_no], :unique => false, :name => 'resultno_eno_cardid_chain'
    add_index :meddling_success_rates, :success
    add_index :meddling_success_rates, :miss
    add_index :meddling_success_rates, :no_apply
    add_index :meddling_success_rates, :sum
    add_index :meddling_success_rates, :rate
  end
end
