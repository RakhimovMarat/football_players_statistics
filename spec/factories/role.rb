FactoryBot.define do
  factory :role do
    name { ["goalkeeper", "defender", "midfielder", "forward"].sample }
  end
end
