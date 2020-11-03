class AddGetTypeComplexIndexToGetCard < ActiveRecord::Migration[6.0]
  def change
    add_index :get_cards, [:get_type, :result_no, :generate_no, :e_no, :card_id], :unique => false, :name => 'gettype_and_resultno_and_eno_and_cardid'
  end
end
