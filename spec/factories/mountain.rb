FactoryBot.define do
  factory :mountain do
    mountain_name { Faker::Mountain.name }
    address { Faker::Address.city }
    time { Faker::Lorem.characters(number: 6) }
    elevation { Faker::Number.number(digits: 5) }
    difficulty { Faker::Number.number(digits: 1) }
    station { Faker::Lorem.characters(number: 10) }
    season { Faker::Lorem.characters(number: 10) }
    parking { Faker::Lorem.characters(number: 15) }
    distance { Faker::Number.number(digits: 2) }
    furigana { Faker::Lorem.characters(number: 5) }
    area { Faker::Address.state }
    mountain_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg'))}
  end
end
