class Item < ApplicationRecord
  has_one_attached :image
  has_one :purchase
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :area
  belongs_to :day
  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
  end
  with_options numericality: { other_than: 1 }, presence: true do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :area_id
    validates :days_id
  end
  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: VALID_PRICE_REGEX, message: "is not a number" }, presence: true
end
