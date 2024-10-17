FactoryBot.define do
  factory :statistic do
    saves           { rand(0..3) }
    clean_sheets    { rand(0..3) }
    goals           { rand(0..3) }
    assists         { rand(0..3) }
    shots           { rand(0..3) }
    shots_on_target { rand(0..3) }
    tackles         { rand(0..3) }
    passes          { rand(0..3) }
    yellow_cards    { rand(0..3) }
  end
end
