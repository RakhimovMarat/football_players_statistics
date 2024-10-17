class StatisticsController < ApplicationController
  def create
    @statistic = Statistic.new(statistic_params)
    if @statistic.save
      render json: @statistic, status: :created
    else
      render json: @statistic.errors, status: :unprocessable_entity
    end
  end

  def top_players(team_id, role_id, start_date, end_date, limit)
    top_players = Statistic.joins(:player, :match, :role)
                           .where(players: { team_id: team_id })
                           .where(roles: { id: role_id })
                           .where(matches: { match_date: start_date..end_date })
                           .group('players.id', 'players.name')
                           .select('players.id, players.name AS player_name, SUM(statistics.player_rating) AS total_rating')
                           .order('total_rating DESC')
                           .limit(limit)

    top_players.map { |stat| { player_name: stat.player_name, rating: stat.total_rating } }
  end

  private

  def statistic_params
    params.require(:statistic).permit(:saves, :clean_sheets, :goals,
                                      :assists, :shots, :shots_on_target,
                                      :tackles, :passes, :yellow_cards,
                                      :player_id, :match_id,:role_id)
  end
end
