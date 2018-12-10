class AddOrderColumnToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :order, :integer
    add_index  :bugs, :order
  end
end
