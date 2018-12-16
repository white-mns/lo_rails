class AddTurnLineColumnToDamage < ActiveRecord::Migration[5.2]
  def change
    add_column :damages, :turn,        :integer
    add_column :damages, :line,        :integer
    add_column :damages, :target_line, :integer
    add_index  :damages, :turn
    add_index  :damages, :line
    add_index  :damages, :target_line
  end
end
