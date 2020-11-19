require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  describe '商品出品登録' do
    context '登録が出来る時' do
      it '全部入力していると登録できる' do
        expect(@product).to be_valid
      end
    end
    context '登録が出来ない時' do
      it '画像が空では登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @product.product_name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品説明が空では登録できない' do
        @product.product_info = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product info can't be blank")
      end
      it '商品状態が空では登録できない' do
        @product.product_condition_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Product condition can't be blank")
      end
      it '商品カテゴリーが空では登録できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it '配送負担料が空では登録できない' do
        @product.delivery_charge_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送地域が空では登録できない' do
        @product.shipping_area_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送までの日数が空では登録できない' do
        @product.shipping_date_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '料金が空では登録できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が、¥300以上でないと登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than 300')
      end
      it '価格の範囲が、¥9,999,999以下でないと登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than 9999999')
      end
      it '価格は半角数字でないと登録できない' do
        @product.price = '百'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
