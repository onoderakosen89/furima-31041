class Product < ApplicationRecord
  has_one :order
  belongs_to :user
  belongs_to :item_conditions
  belongs_to :shipping_areas
  belongs_to :shipping_date
  belongs_to :categories
end
