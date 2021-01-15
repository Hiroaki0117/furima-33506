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
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :state_id, numericality: { other_than: 1 }, presence: true
  validates :delivery_fee_id, numericality: { other_than: 1 }, presence: true
  validates :area_id, numericality: { other_than: 1 }, presence: true
  validates :days_id, numericality: { other_than: 1 }, presence: true
  validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, presence: true
end
