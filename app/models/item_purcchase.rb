class ItemPurchase
  include ActiveModel::Model
  attr_accessor :token, :post_code, :city, :street_number, :buildings, :phone_number
  
  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/, message: "Input only number" }
  end
  validates :area_id, numericality: { other_than: 1 }, presence: true
  def save
  end
end