class CalculatePlayersRatingJob < ApplicationJob
  queue_as :default

  def perform(statistic_id)
    statistic = Statistic.find(statistic_id)

    statistic.skip_player_rating_callback = true
    match_importance = statistic.match.match_importance

    rating = case statistic.role.name
             when 'goalkeeper'
              calculate_goalkeeper_rating(statistic, match_importance)
             when 'defender'
              calculate_defender_rating(statistic, match_importance)
             when 'midfielder'
              calculate_midfielder_rating(statistic, match_importance)
             when 'forward'
              calculate_forward_rating(statistic, match_importance)
             end

    statistic.update(player_rating: rating)
    statistic.skip_player_rating_callback = false
  end

  private

  def calculate_goalkeeper_rating(statistic, match_importance)
    (statistic.saves * 3 + statistic.clean_sheets * 2 + statistic.goals * 1) * match_importance
  end

  def calculate_defender_rating(statistic, match_importance)
    (statistic.tackles * 3 + statistic.passes * 2 + statistic.assists * 1 - statistic.yellow_cards * 1) * match_importance
  end

  def calculate_midfielder_rating(statistic, match_importance)
    (statistic.assists * 3 + statistic.goals * 2 + statistic.passes * 1 - statistic.yellow_cards * 2) * match_importance
  end

  def calculate_forward_rating(statistic, match_importance)
    (statistic.goals * 3 + statistic.shots_on_target * 2 + statistic.shots * 1 - statistic.yellow_cards * 3) * match_importance
  end
end
