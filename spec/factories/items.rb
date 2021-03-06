FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    shopping_cost_id { Faker::Number.between(from: 2, to: 3) }
    takes_day_id { Faker::Number.between(from: 2, to: 4) }
    used_id { Faker::Number.between(from: 2, to: 7) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end
