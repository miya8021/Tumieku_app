FactoryBot.define do
  factory :artice do
    day { "2021-05-25" }
    minutes { 1 }
    body { "MyText" }
    user { nil }
  end
end
