class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_area
  belongs_to :shipping_date
  belongs_to :delivery_charge
  has_one_attached :image

  with_options presence: true do
    VALID_PRICE_REGEX = /\A[0-9]+\z/.freeze
    validates :product_name
    validates :product_info
    validates :image,                     unless: :was_attached?
    validates :price,                     numericality: { only_integer: true,
                                          greater_than: 300, less_than: 9999999}
    validates :product_condition_id, numericality:  { other_than: 1 }
    validates :category_id, numericality:           { other_than: 1 }
    validates :shipping_area_id, numericality:      { other_than: 1 }
    validates :shipping_date_id, numericality:      { other_than: 1 }
    validates :delivery_charge_id, numericality:    { other_than: 1 }
  end
  def was_attached?
    self.image.attached?
  end
end
