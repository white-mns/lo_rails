class AddIndexToTraining < ActiveRecord::Migration[5.2]
  def change
    add_index :trainings, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :trainings, :training_type
    add_index :trainings, :training
  end
end
