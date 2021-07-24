FactoryBot.define do
  factory :article do
    day { Faker::Date.in_date_period }
    minutes { Faker::Number.within(range: 1..300) }
    body { Faker::Lorem.paragraph }
    user
    exercise_id { FactoryBot.create(:exercise).id }
  end

  trait :invalid do
    body { nil }
  end
end