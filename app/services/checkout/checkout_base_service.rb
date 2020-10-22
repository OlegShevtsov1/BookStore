module Checkout
  class CheckoutBaseService
    STEP_SERVICES = {
      address: Checkout::CheckoutAddressService,
      delivery: Checkout::CheckoutShippingService,
      payment: Checkout::CheckoutPaymentService
    }.freeze

    attr_reader :params, :current_user, :current_order, :current_step

    def initialize(params, current_user, current_order)
      @params = params
      @current_order = current_order
      @current_user = current_user
      @current_step = define_current_step
    end

    private

    def define_current_step
      @current_order.address! if @current_order.in_cart?
      @current_order.status
    end
  end
end
