FactoryBot.define do
  factory :item do
    name {"アイウエオ"}
    explanation {"この商品はっっっ"}
    category_id {2}
    state_id {3}
    delivery_fee_id {3}
    area_id {3}
    days_id {3}
    price {300}
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
