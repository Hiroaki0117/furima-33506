class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Include both letters and numbers' } do
    validates :password
  end 
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :family_name
    validates :first_name
  end
  with_options presence: true, format: { with:/\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" } do
    validates :kana_family_name
    validates :kana_first_name
  end
  validates :birth_day, presence: true

  has_many :items
  has_many :purchases
end
