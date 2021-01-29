class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は英数字混合にしてください' }
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  with_options presence: true, format: { with: VALID_NAME_REGEX, message: 'は全角文字で入力してください' } do
    validates :family_name
    validates :first_name
  end
  VALID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  with_options presence: true, format: { with: VALID_KANA_NAME_REGEX, message: "は全角カナ文字で入力してください" } do
    validates :kana_family_name
    validates :kana_first_name
  end
  validates :birth_day, presence: true

  has_many :items
  has_many :purchases
end
