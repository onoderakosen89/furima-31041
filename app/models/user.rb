class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birthday, presence: true
  with_options presence: true do
    VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
    VALID_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)\w{6,12}\z/.freeze

    validates :first_name, format: { with: VALID_ZENKAKU_REGEX, message: '全角文字を使用してください' }
    validates :family_name, format: { with: VALID_ZENKAKU_REGEX, message: '全角文字を使用してください' }
    validates :first_name_kana, format: { with: VALID_KANA_REGEX, message: 'カタカナを使用してください' }
    validates :family_name_kana, format: { with: VALID_KANA_REGEX, message: 'カタカナを使用してください' }
  end
  validates :password, presence: true, length: { minimum: 6 },
                       format: { with: VALID_PASSWORD_REGEX,
                                 message: 'は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります' }
  validates :password_confirmation, presence: true, length: { minimum: 6 },
                                 format: { with: VALID_PASSWORD_REGEX,
                                           message: 'パスワードは確認用を含めて2回入力する必要があります' }
  has_many :products
  has_many :orders
end
