FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '東京都' }
    block_number { '1-1' }
    house_name { '東京ハイツ' }
    phone_number { "08011111111" }
  end
end
