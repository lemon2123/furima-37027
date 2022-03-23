class RecordAddress
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :delivery_city, :delivery_number, :building_name, :phone_number, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '10桁か11桁の数字を使用してください' }
  end

  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_city, presence: true
  validates :delivery_number, presence: true
  validates :token, presence: true

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, delivery_area_id: delivery_area_id, delivery_city: delivery_city, delivery_number: delivery_number, building_name: building_name, phone_number: phone_number, record_id: record.id)
  end
end