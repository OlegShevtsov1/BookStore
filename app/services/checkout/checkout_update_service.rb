module Checkout
  class CheckoutUpdateService < CheckoutBaseService
    attr_reader :current_service, :next_step

    def initialize(params, current_user, current_order)
      super
      @current_service = STEP_SERVICES[current_step.to_sym].new(params, current_user, current_order)
    end

    def call
      @next_step = current_service.call
    end
  end
end
