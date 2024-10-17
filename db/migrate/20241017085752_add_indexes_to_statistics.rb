class AddIndexesToStatistics < ActiveRecord::Migration[7.1]
  def change
    add_index :statistics, [:player_id, :match_id, :role_id]
  end
end
