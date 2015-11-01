class CartController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @cart = current_user.cart    
  end
end
