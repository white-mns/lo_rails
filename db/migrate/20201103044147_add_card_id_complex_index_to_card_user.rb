class AddCardIdComplexIndexToCardUser < ActiveRecord::Migration[6.0]
  def change
    add_index :card_users, [:card_id, :e_no, :result_no, :generate_no, :party], :unique => false, :name => 'cardid_and_eno_and_resultno_and_party'
  end
end
