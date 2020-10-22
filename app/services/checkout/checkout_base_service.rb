module Checkout
  class CheckoutBaseService
    STEP_SERVICES = {
      address: Checkout::CheckoutAddressService,
      shipping: Checkout::CheckoutShippingService
    }.freeze

    attr_reader :params, :current_user, :current_order, :current_step

    def initialize(params, current_user, current_order)
      @params = params
      @current_order = current_order
      @current_user = current_user
      @current_step = params[:step]
    end
  end
end
