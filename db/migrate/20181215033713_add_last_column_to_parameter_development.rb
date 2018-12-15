class AddLastColumnToParameterDevelopment < ActiveRecord::Migration[5.2]
  def change
    add_column :parameter_developments, :last_result_no,   :integer
    add_column :parameter_developments, :last_generate_no, :integer
    add_index  :parameter_developments, :last_result_no
    add_index  :parameter_developments, :last_generate_no
  end
end
