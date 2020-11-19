FactoryBot.define do
  factory :product do
    product_name          { 'test' }
    product_info          { 'test' }
    category_id           { '2' }
    product_condition_id  { '2' }
    delivery_charge_id    { '2' }
    shipping_area_id      { '2' }
    shipping_date_id      { '2' }
    price                 { '301' }
    association :user, factory: :user
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.gif'), filename: 'test_image.gif')
    end
  end
end
