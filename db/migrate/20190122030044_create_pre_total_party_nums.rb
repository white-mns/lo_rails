class CreatePreTotalPartyNums < ActiveRecord::Migration[5.2]
  def change
    create_table :pre_total_party_nums do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :count_type
      t.integer :party_num

      t.timestamps
    end
  end
end
