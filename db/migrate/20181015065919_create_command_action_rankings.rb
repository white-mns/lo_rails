class CreateCommandActionRankings < ActiveRecord::Migration[5.2]
  def change
    create_table :command_action_rankings do |t|
      t.integer :result_no
      t.integer :generate_no
      t.integer :card_id
      t.integer :rank_type
      t.integer :rank
      t.integer :num

      t.timestamps
    end
  end
end
