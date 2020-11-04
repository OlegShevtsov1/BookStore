module Checkout
  class CheckoutBaseService
    STEP_SERVICES = {
      address: Checkout::CheckoutAddressService,
      choose_delivery: Checkout::CheckoutShippingService,
      pay: Checkout::CheckoutPaymentService,
      confirmation: Checkout::CheckoutConfirmService,
      completed: Checkout::CheckoutCompleteService
    }.freeze

    attr_reader :params, :current_user, :current_order, :current_step, :step

    def initialize(params, current_user, current_order)
      @params = params
      @current_order = current_order
      @current_user = current_user
      @current_step = define_current_step
      @step = define_step
    end

    private

    def define_step
      params[:step] || current_step
    end

    def define_current_step
      @current_order.address! if @current_order.in_cart?
      @current_order.status
    end
  end
end
