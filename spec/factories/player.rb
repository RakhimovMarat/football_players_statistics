FactoryBot.define do
  factory :player do
    name { Faker::Sports::Football.player }

    association :team
  end
end
