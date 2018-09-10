class AddIndexToMaxChain < ActiveRecord::Migration[5.2]
  def change
    add_index :max_chains, [:battle_page, :party, :result_no, :generate_no], :unique => false, :name => 'resultno_and_battle_page'
    add_index :max_chains, :max_chain
  end
end
