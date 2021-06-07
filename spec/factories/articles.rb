FactoryBot.define do
  factory :article do
    day { Faker::Date.in_date_period }
    minutes { Faker::Number.within(range: 1..300) }
    body { Faker::Lorem.paragraph }
    trait :exercise do
      name { "腹筋" }
    end
    user
    like
  end
end