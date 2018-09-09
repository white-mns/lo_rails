class CreateDevelopmentResults < ActiveRecord::Migration[5.2]
  def change
    create_table :development_results do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :development_result
      t.integer :bellicose
      t.integer :party_num

      t.timestamps
    end
  end
end
