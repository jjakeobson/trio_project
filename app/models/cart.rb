class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :cart_items

  def purchase_items
    # cart_items purchase
    update_attribute(:is_active, false)
    Cart.create(user: user)
  end

  def unique_cart_items
    cart_items.select("distinct on (product_id) *")
  end

  def total
    @total = 0
    unique_cart_items.each do |cart_item|
      @total += cart_item.quantity * cart_item.product.price_in_cents
    end
    @total = @total / 100
  end
end
