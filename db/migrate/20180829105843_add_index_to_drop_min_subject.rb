class AddIndexToDropMinSubject < ActiveRecord::Migration[5.2]
  def change
    add_index :drop_min_subjects, [:result_no, :generate_no], :unique => false, :name => 'resultno_and_generateno'
    add_index :drop_min_subjects, :card_id
    add_index :drop_min_subjects, :slash
    add_index :drop_min_subjects, :thrust
    add_index :drop_min_subjects, :stroke
    add_index :drop_min_subjects, :shot
    add_index :drop_min_subjects, :guard
    add_index :drop_min_subjects, :dance
    add_index :drop_min_subjects, :theft
    add_index :drop_min_subjects, :cooking
    add_index :drop_min_subjects, :technology
    add_index :drop_min_subjects, :movement
    add_index :drop_min_subjects, :chemistry
    add_index :drop_min_subjects, :arithmetic
    add_index :drop_min_subjects, :fire
    add_index :drop_min_subjects, :theology
    add_index :drop_min_subjects, :life
    add_index :drop_min_subjects, :demonology
    add_index :drop_min_subjects, :geography
    add_index :drop_min_subjects, :astronomy
    add_index :drop_min_subjects, :fengshui
    add_index :drop_min_subjects, :psychology
    add_index :drop_min_subjects, :music
    add_index :drop_min_subjects, :curse
    add_index :drop_min_subjects, :illusion
    add_index :drop_min_subjects, :trick
  end
end
