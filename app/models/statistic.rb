class Statistic < ApplicationRecord
  belongs_to :player
  belongs_to :match
  belongs_to :role

  attr_accessor :skip_player_rating_callback
  after_save :calculate_player_rating, unless: :skip_player_rating_callback

  def self.top_five_players(team_id, role_id, start_date, end_date)
    players = Statistic.joins(:player, :match)
                       .where(players: { team_id: team_id },
                              role_id: role_id,
                              matches: { match_date: start_date..end_date })
                       .select('player_id, SUM(player_rating) AS total_rating')
                       .group(:player_id)
                       .order('SUM(player_rating) DESC')
                       .limit(5)

    players.map { |statistic| statistic.attributes.slice('player_id', 'total_rating') }
  end

  private

  def calculate_player_rating
    CalculatePlayersRatingJob.perform_later(self.id)
  end
end
