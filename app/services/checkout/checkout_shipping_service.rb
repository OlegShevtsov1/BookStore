module Checkout
  class CheckoutShippingService
    attr_reader :shippings, :params, :current_order

    def initialize(params, current_user, current_order)
      @params = params
      @current_user = current_user
      @current_order = current_order
    end

    def call
      current_order.update(shipping_id: params[:shipping_id])
      current_order.payment! if current_order.may_payment?
    end

    def show
      @shippings = Shipping.all
      self
    end
  end
end
