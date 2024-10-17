require 'rails_helper'

RSpec.describe StatisticsController, type: :controller do
  describe 'statistic create' do
    let!(:team)   { create :team }
    let!(:player) { create :player, team: team }
    let!(:role)   { create :role }
    let!(:match)  { create :match }

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
end
