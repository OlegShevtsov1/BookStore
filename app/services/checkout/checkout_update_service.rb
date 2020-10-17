module Checkout
  class CheckoutUpdateService
    STEP_SERVICES = {
      address: Checkout::CheckoutAddressService
    }.freeze

    attr_reader :params, :current_user, :next_step, :current_order

    def initialize(params, current_user, current_order)
      @params = params
      @current_order = current_order
      @current_user = current_user
      @current_step = params[:step]
    end

    def call
      @next_step = current_service.call
    end

    def current_service
      @current_service = STEP_SERVICES[@current_step.to_sym].new(params, current_user, current_order)
    end
  end
end
