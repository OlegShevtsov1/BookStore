module Checkout
  class CheckoutShowService < CheckoutBaseService
    STEPS_COUNT = 5
    attr_reader :current_service, :statuses

    def initialize(params, current_user, current_order)
      super
      @statuses = Order.statuses.keys[1..STEPS_COUNT]
      @current_service = define_current_service.show
    end

    def call(current_service)
      @current_service = current_service
      self
    end

    def current_step?(step)
      current_step == step
    end

    private

    def define_current_service
      @current_service = STEP_SERVICES[@current_step.to_sym].new(params, current_user, current_order)
    end
  end
end
