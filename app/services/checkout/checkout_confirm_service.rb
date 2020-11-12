module Checkout
  class CheckoutConfirmService
    attr_reader :addresses, :shipping, :payment

    def initialize(params, current_user, current_order)
      @params = params
      @current_user = current_user
      @current_order = current_order
    end

    def call
      @current_order.completed! if @current_order.may_complete?
    end

    def show
      @addresses = Settings::SettingsIndexService.new(@current_user)
      @shipping = @current_order.shipping
      @payment = @current_order.credit_card
      self
    end
  end
end
