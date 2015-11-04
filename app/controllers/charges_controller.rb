class ChargesController < ApplicationController
  before_action :set_cart

  def new
  end

  def create
    # Amount in cents

    customer = Stripe::Customer.create(
      email: 'example@stripe.com',
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @cart.total,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
  end

  def paid
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cart
    @cart = Cart.find_by(user_id: current_user.id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # def cart_params
  #   params.require(:cart)
  # end
end
