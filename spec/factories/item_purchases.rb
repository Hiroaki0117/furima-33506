FactoryBot.define do
  factory :item_purchase do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    area_id { 2 }
    city { '東京都' }
    street_number { '1-1' }
    buildings { '東京ハイツ' }
    phone_number { "09011111111" }
    user_id {1}
    item_id {1}
  end
end