class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_date
  belongs_to_active_hash :delivery_charge

validates :category_id, numericality: { other_than: 1 }
validates :item_condition_id, numericality: { other_than: 1 }
validates :shipping_area_id, numericality: { other_than: 1 }
validates :shipping_date_id, numericality: { other_than: 1 }
validates :delivery_charge_id, numericality: { other_than: 1 }
end
