class AddPlayerRatingToStatistics < ActiveRecord::Migration[7.1]
  def change
    add_column :statistics, :player_rating, :float
  end
end
