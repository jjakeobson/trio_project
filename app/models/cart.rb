class Cart < ActiveRecord::Base
  belongs_to :user

  def purchase_items
    # cart_items purchase
    update_attribute(:is_active, false)
    Cart.create(user: user)
  end
end
