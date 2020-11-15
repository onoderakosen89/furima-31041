class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } 
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' } 
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用してください' } 
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナを使用してください' } 
  end
  
  has_many :products
  has_many :orders
end
