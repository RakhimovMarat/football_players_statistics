class Statistic < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :role

  attr_accessor :skip_player_rating_callback
  after_save :calculate_player_rating, unless: :skip_player_rating_callback

  private

  def calculate_player_rating
    CalculatePlayersRatingJob.perform_later(self.id)
  end
end
