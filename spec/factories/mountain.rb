FactoryBot.define do
  factory :mountain do
    mountain_name { Faker::Lorem.characters(number: 5) }
    address {  }
    time {  }
    elevation {  }
    difficulty {  }
    station {  }
    season {  }
    parking {  }
    distance {  }
  end
end
