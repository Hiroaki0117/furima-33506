class ItemPurchase
  include ActiveModel::Model
  attr_accessor :token, :post_code, :area_id, :city, :street_number, :buildings, :phone_number, :user_id, :item_id
  
  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city
    validates :street_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "Input only number" }
    validates :token
    validates :user_id
    validates :item_id
  end
  validates :area_id, numericality: { other_than: 1 }, presence: true
  def save
    purchase = Purchase.create( user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, city: city, street_number: street_number, buildings: buildings, phone_number: phone_number, purchase_id: purchase.id)
  end
end