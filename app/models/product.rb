class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_area
  belongs_to :shipping_date
  belongs_to :delivery_charge


validates :product_name, presence: true
validates :product_info, presence: true
validates :product_condition_id, numericality: { other_than: 1 }
validates :category_id, numericality: { other_than: 1 }
validates :shipping_area_id, numericality: { other_than: 1 }
validates :shipping_date_id, numericality: { other_than: 1 }
validates :delivery_charge_id, numericality: { other_than: 1 }
end
