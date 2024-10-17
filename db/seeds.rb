# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

teams = []
players = []
roles = []
matches = []
n = 3

10.times do
  team = Team.create(name: Faker::Sports::Football.team)
  teams << team if team.persisted?
end

50.times do
  player = Player.create(name: Faker::Sports::Football.player, team: teams.sample)
  players << player if player.persisted?
end

["goalkeeper", "defender", "midfielder", "forward"].each do |player_role|
  role = Role.create(name: player_role)
  roles << role if role.persisted?
end

1000.times do
  match = Match.create(match_date: Faker::Date.between(from: '2024-01-01', to: '2025-01-01'),
  match_importance: rand(0.1..1.0).round(1))
  matches << match if match.persisted?
end

matches.each do |match|
  Statistic.create(saves: rand(0..n),
                   clean_sheets: rand(0..n),
                   goals: rand(0..n),
                   assists: rand(0..n),
                   shots: rand(0..n),
                   shots_on_target: rand(0..n),
                   tackles: rand(0..n),
                   passes: rand(0..n),
                   yellow_cards: rand(0..n),
                   player: players.sample,
                   match: match,
                   role: roles.sample
  )
end
