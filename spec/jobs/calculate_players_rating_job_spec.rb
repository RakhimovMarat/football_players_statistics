require 'rails_helper'

RSpec.describe CalculatePlayersRatingJob, type: :job do
  let!(:team)      { create :team }
  let!(:player)    { create :player, team: team }
  let!(:match)     { create(:match) }
  let!(:role)      { create(:role) }
  let!(:statistic) { create(:statistic, player: player, match: match, role: role) }

  describe 'background job' do
    it 'calculates and updates the player rating' do
      expect { described_class.perform_now(statistic.id) }.to change { statistic.reload.player_rating }

      case statistic.role.name
      when 'goalkeeper'
        expected_rating = (statistic.saves * 3 + statistic.clean_sheets * 2 + statistic.goals * 1) * statistic.match.match_importance
      when 'defender'
        expected_rating = (statistic.tackles * 3 + statistic.passes * 2 + statistic.assists * 1 - statistic.yellow_cards * 1) * statistic.match.match_importance
      when 'midfielder'
        expected_rating = (statistic.assists * 3 + statistic.goals * 2 + statistic.passes * 1 - statistic.yellow_cards * 2) * statistic.match.match_importance
      when 'forward'
        expected_rating = (statistic.goals * 3 + statistic.shots_on_target * 2 + statistic.shots * 1 - statistic.yellow_cards * 3) * statistic.match.match_importance
      end

      described_class.perform_now(statistic.id)

      expect(statistic.player_rating).to eq(expected_rating)
    end
  end
end
