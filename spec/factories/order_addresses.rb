FactoryBot.define do
  factory :order_address do
    transient do
      address { Gimei.address }
    end
    # association :user
    # association :item
    # user_id { user.id }
    # item_id { item.id }
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    city { address.city.to_s }
    address_line1 { address.town.to_s }
    address_line2 { Faker::Company.name }
    phone_number  { '0' + Faker::Number.leading_zero_number(digits: 10) }
  end
end
