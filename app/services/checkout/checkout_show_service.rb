module Checkout
  class CheckoutShowService
    STEPS_COUNT = 5
    attr_reader :statuses, :current_step, :current_order, :current_service

    def initialize(params, current_user, current_order, current_service)
      @params = params
      @current_order = current_order
      @current_user = current_user
      @statuses = Order.statuses.keys[1..STEPS_COUNT]
      @current_step = params[:step]
      @current_service = current_service || Settings::SettingsIndexService.new(current_user)
    end
  end
end
