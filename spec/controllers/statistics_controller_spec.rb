require 'rails_helper'

RSpec.describe StatisticsController, type: :controller do
  let!(:team)   { create :team }
  let!(:player) { create :player, team: team }
  let!(:role)   { create :role }
  let!(:match)  { create :match }

  describe 'statistic create' do
    context 'with valid attributes' do

      let(:statistic_attributes) do
        attributes_for(:statistic).merge(player_id: player.id, match_id: match.id, role_id: role.id)
      end

      subject { post :create, params: { statistic: statistic_attributes } }

      it 'creates new statistic' do
        expect { subject }.to change(Statistic, :count).by(1)
      end
    end
  end

  describe 'fetch top players' do
    let!(:team) { create(:team) }
    let!(:role) { create(:role, name: "forward") }
    let!(:player1) { create(:player, team: team) }
    let!(:player2) { create(:player, team: team) }
    let!(:player3) { create(:player, team: team) }
    let!(:match1) { create(:match, match_date: Date.today) }
    let!(:match2) { create(:match, match_date: Date.today) }

    before do
      create(:statistic, player: player1, match: match1, role: role, player_rating: 8.5)
      create(:statistic, player: player2, match: match1, role: role, player_rating: 9.0)
      create(:statistic, player: player3, match: match2, role: role, player_rating: 7.0)
    end

  end
end
