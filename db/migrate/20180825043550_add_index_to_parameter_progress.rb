class AddIndexToParameterProgress < ActiveRecord::Migration[5.2]
  def change
    add_index :parameter_progresses, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :parameter_progresses, :tip
    add_index :parameter_progresses, :tip_t
    add_index :parameter_progresses, :build_t
    add_index :parameter_progresses, :mark_t

  end
end
