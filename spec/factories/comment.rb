FactoryBot.define do
  factory :comment do
    title { Faker::String.random(length: 3..10) }
    content { Faker::String.random(length: 10..20) }
    user
    mountain
  end
end
