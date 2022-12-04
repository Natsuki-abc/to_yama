FactoryBot.define do
  factory :comment do
    title { Faker::Lorem.characters(number: 5) }
    content { Faker::Lorem.characters(number: 30) }
    user
    mountain
  end
end
