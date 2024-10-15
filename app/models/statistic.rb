class Statistic < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :role

  after_create :calculate_player_rating

  private

  def calculate_player_rating
    CalculatePlayersRatingJob.perform_later(self.id)
  end
end
