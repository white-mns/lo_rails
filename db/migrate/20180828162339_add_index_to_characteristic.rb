class AddIndexToCharacteristic < ActiveRecord::Migration[5.2]
  def change
    add_index :characteristics, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :characteristics, :str
    add_index :characteristics, :vit
    add_index :characteristics, :int
    add_index :characteristics, :mnd
    add_index :characteristics, :tec
    add_index :characteristics, :eva
  end
end
