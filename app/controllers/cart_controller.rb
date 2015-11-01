class CartController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @cart = current_user.cart
  end

  def add_item
    current_user.cart.cart_items.create(product_id: params[:product_id])
    redirect_to cart_path
  end
end
