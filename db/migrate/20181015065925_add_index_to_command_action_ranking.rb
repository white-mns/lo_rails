class AddIndexToCommandActionRanking < ActiveRecord::Migration[5.2]
  def change
    add_index :command_action_rankings, [:result_no, :generate_no], :unique => false, :name => 'resultno_and_generateno'
    add_index :command_action_rankings, :card_id
    add_index :command_action_rankings, :rank_type
    add_index :command_action_rankings, :rank
    add_index :command_action_rankings, :num
  end
end
