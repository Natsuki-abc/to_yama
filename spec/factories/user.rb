FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 5) }
    email { Faker::Internet.email }
    password { 'test1234' }
    password_confirmation { 'test1234' }
  end
end
