FactoryBot.define do
  factory :record_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    delivery_area_id { 2 }
    delivery_city { '東京都' }
    delivery_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
