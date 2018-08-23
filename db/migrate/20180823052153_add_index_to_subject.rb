class AddIndexToSubject < ActiveRecord::Migration[5.2]
  def change
    add_index :subjects, [:e_no, :result_no, :generate_no], :unique => false, :name => 'resultno_and_eno'
    add_index :subjects, :slash
    add_index :subjects, :thrust
    add_index :subjects, :stroke
    add_index :subjects, :shot
    add_index :subjects, :guard
    add_index :subjects, :dance
    add_index :subjects, :theft
    add_index :subjects, :cooking
    add_index :subjects, :technology
    add_index :subjects, :movement
    add_index :subjects, :chemistry
    add_index :subjects, :arithmetic
    add_index :subjects, :fire
    add_index :subjects, :theology
    add_index :subjects, :life
    add_index :subjects, :demonology
    add_index :subjects, :geography
    add_index :subjects, :astronomy
    add_index :subjects, :fengshui
    add_index :subjects, :psychology
    add_index :subjects, :music
    add_index :subjects, :curse
    add_index :subjects, :illusion
    add_index :subjects, :trick
  end
end
