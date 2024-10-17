FactoryBot.define do
  factory :match do
    match_date       { Faker::Date.between(from: '2024-01-01', to: '2025-01-01') }
    match_importance { rand(0.1..1.0).round(1) }
  end
end
