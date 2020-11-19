class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer   :user_id, foreign_key: true, null: false
      t.string    :product_name, null: false
      t.text      :product_info, null: false
      t.integer   :category_id, null: false
      t.integer   :product_condition_id, null: false
      t.integer   :delivery_charge_id, null: false
      t.integer   :shipping_area_id, null: false
      t.integer   :shipping_date_id, null: false
      t.integer   :price, null: false
      
      t.timestamps
    end
  end
end
