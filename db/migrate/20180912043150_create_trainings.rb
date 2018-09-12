class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :training_type
      t.integer :training

      t.timestamps
    end
  end
end
