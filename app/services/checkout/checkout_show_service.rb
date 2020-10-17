module Checkout
  class CheckoutShowService
    STEPS_COUNT = 5
    attr_reader :statuses, :current_step, :current_service

    def initialize(params, current_user, current_order, _current_service)
      @params = params
      @current_order = current_order
      @current_user = current_user
      @statuses = Order.statuses.keys[1..STEPS_COUNT]
      @current_step = params[:step]
      @current_service = Checkout::CheckoutAddressService.new(params, current_user, current_order)
    end
  end
end
