class CreatePgws < ActiveRecord::Migration[5.2]
  def change
    create_table :pgws do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :pgws_type
      t.integer :pgws_name_id

      t.timestamps
    end
  end
end
