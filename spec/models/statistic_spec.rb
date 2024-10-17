require 'rails_helper'

RSpec.describe Statistic, type: :model do
  describe 'associations' do
    it { should belong_to :player }
    it { should belong_to :match }
    it { should belong_to :role }
  end

  # describe 'callback' do
  #   it 'triggers CalculatePlayersRatingJob after save' do
  #     expect(CalculatePlayersRatingJob).to receive(:perform_later).with(statistic.id)
  #     statistic.save
  #   end
  # end

  describe 'top players' do
    let!(:team)      { create :team }
    let!(:players)    { create_list(:player, 10, team: team) }
    let!(:matches)     { create_list(:match, 30) }
    let!(:role)      { create(:role, name: 'goalkeeper') }
  #  let!(:statistic) { create_list(:statistic, 30, player: player, match: match, role: role) }

    let!(:statistics) do
      create_list(:statistic, 50, player: players.sample, match: matches.sample, role: role,
                    player_rating: rand(1.0..10.0))
    end
    it 'fetching top five players by rating' do
      start_date = Date.new(2024, 1, 1)
      end_date = Date.new(2025, 1, 1)

      top_players = Statistic.top_five_players(team.id, role.id, start_date, end_date)

      expect(top_players.size).to eq(5)
      expect(top_players.map(&:total_rating)).to eq(top_players.map(&:total_rating).sort.reverse.first(5))
    end
  end


end
