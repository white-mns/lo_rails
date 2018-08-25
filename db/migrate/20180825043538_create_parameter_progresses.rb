class CreateParameterProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :parameter_progresses do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :e_no
      t.integer :tip
      t.integer :tip_t
      t.integer :build_t
      t.integer :mark_t

      t.timestamps
    end
  end
end
