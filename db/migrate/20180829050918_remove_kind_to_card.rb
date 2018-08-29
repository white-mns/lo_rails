class RemoveKindToCard < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :kind, :integer
  end
end
