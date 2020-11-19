class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
 
  end

  def new
    # @categoryies = Category.all
    # @item_conditions = Item_condition.all
    # @deribary_charges = Deribary_charge.all
    # @shipping_areas = Shipping_area.all
    # @shipping_dates = Shipping_date.all
  end

  def edit
  end

  def show
  end
end
