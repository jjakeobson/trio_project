class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product

  # def add_item
  #   cart_items.create(product_id: 1)
  # end
  def quantity #work on this method
    cart.cart_items.where(product_id: self.product_id).count
  end
end
