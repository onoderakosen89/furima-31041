class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    # @products = Product.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
   
    if @product.save
      redirect_to root_path
    else
      binding.pry
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :product_info, :category_id, :product_condition_id, :delivery_charge_id, :shipping_area_id, :shipping_date_id, :price,).merge(user_id: current_user.id)
  end
end
