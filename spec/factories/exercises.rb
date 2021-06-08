FactoryBot.define do
  factory :exercise do
    name { "腹筋" }
    user
  end

  trait :invalid do
    name { nil }
  end
end
