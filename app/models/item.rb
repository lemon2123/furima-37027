class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :Day
  validates :day_id, numericality: { other_than: 1 , message: "can't be blank"}


end
