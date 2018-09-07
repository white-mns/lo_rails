class AddIndexToCard < ActiveRecord::Migration[5.2]
  def change
    add_index :cards, [:e_no, :s_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :cards, :name
    add_index :cards, :possession
    add_index :cards, :kind
    add_index :cards, :card_id
  end
end
