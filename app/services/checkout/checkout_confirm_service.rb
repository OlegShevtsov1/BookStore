module Checkout
  class CheckoutConfirmService
    attr_reader :addresses

    def initialize(params, current_user, current_order)
      @params = params
      @current_user = current_user
      @current_order = current_order
    end

    def call
      current_order.complete! if current_order.may_complete?
    end

    def show
      @addresses = Settings::SettingsIndexService.new(@current_user)
      self
    end
  end
end
