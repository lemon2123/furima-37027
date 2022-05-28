FactoryBot.define do
  factory :item do
    association :user
    name                 { '色鉛筆' }
    explanation          { '色鉛筆3本セットです' }
    detail_category_id   { 2 }
    detail_status_id     { 2 }
    delivery_id          { 2 }
    delivery_area_id     { 2 }
    delivery_day_id      { 2 }
    price                { 500 }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end