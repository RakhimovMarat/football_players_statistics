class AddYellowCardsToStatistics < ActiveRecord::Migration[7.1]
  def change
    add_column :statistics, :yellow_cards, :integer
  end
end
