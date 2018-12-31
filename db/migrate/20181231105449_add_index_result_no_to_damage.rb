class AddIndexResultNoToDamage < ActiveRecord::Migration[5.2]
  def change
    add_index :damages, :result_no
  end
end
