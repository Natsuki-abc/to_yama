FactoryBot.define do
  factory :mountain do
    mountain_name { Faker::Lorem.words(number: 5) }
    address { Faker::Address.state }
    time { Faker::Lorem.characters(number: 6) }
    elevation { Faker::Number.number(digits: 5) }
    difficulty { Faker::Number.number(digits: 1) }
    station { Faker::String.random(length: 15..30) }
    season { Faker::String.random(length: 3..10) }
    parking { Faker::String.random(length: 10..20) }
    distance { Faker::Number.number(digits: 2) }
    furigana { Faker::Lorem.words(number: 5) }
  end
end
