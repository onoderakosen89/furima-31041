class Product < ApplicationRecord
  has_one :order
  belongs_to :user
  belongs_to :categories
  belongs_to :item_conditions
  belongs_to :shipping_areas
  belongs_to :shipping_date
  belongs_to :delivery_charges
end
