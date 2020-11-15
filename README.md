# db設計

## Usersテーブル

|Column------------|Type-----------|Options-----------|
|nickname----------|string---------|null: false-------|
|email-------------|string---------|null: false-------|
|encrypted_password|string---------|null: false-------|
|family_name-------|string---------|null: false-------|
|fist_name---------|string---------|null: false-------|
|family_name_kana--|string---------|null: false-------|
|fist_name_kana----|string---------|null: false-------|
|birthday----------|date-----------|null: false-------|

### Association
has_many :products
has_many :orders

## Productsテーブル

|Column------------|Type-----------|Options-----------|
|user_id-----------|integer--------|foreign_key: true-|
|product_name------|string---------|null: false-------|
|product_info------|text-----------|null: false-------|
|category_id-------|integer--------|null: false-------|
|item_condition_id-|integer--------|null: false-------|
|delivery_charge_id|integer--------|null: false-------|
|shipping_area_id--|integer--------|null: false-------|
|shipping_date_id--|integer--------|null: false-------|
|price-------------|integer--------|null: false-------|


### Association
has_one :order
belongs_to :user
belongs_to :categories
belongs_to :item_conditions
belongs_to :shipping_areas
belongs_to :shipping_date
belongs_to :delivery_charges


## Ordersテーブル

|Column-----------|Type-----------|Options-----------|

|user_id---------|integer--------|foreign_key: true-|
|product_id------|integer--------|foreign_key: true-|



### Association
belongs_to :user
belongs_to :product
has_one :address

## Addressテーブル

|Column-----------|Type-----------|Options-----------|
|order_id---------|integer--------|foreign_key: true-|
|zip_code---------|string---------|null: false-------|
|prefecture_id----|integer--------|null: false-------|
|city_id----------|integer--------|null: false-------|
|street-----------|text-----------|null: false-------|
|building---------|text-----------|------------------|
|telephone--------|string---------|null: false-------|



### Association
belongs_to :order

