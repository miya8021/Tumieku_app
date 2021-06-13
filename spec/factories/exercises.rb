FactoryBot.define do
  factory :exercise do
    name { "腹筋" }
    user
  end

  trait :exercise_invalid do
    name { "" }
  end
end