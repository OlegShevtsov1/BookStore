module Checkout
  class CheckoutCompleteService
    FIRST_CODE_ORDER_SYMBOL = 'R'.freeze
    COUNT_OF_NUMBERS_IN_ORDER_CODE = 8
    RANGE_OF_ORDER_CODE_NUMBERS = (0..9).freeze

    attr_reader :addresses

    def initialize(params, current_user, current_order)
      @params = params
      @current_user = current_user
      @current_order = current_order
      add_order_code
    end

    def call
      OrderMailer.with(current_order: @current_order).send_thanks_email.deliver_later
      @current_order.completed!
    end

    def show
      @addresses = Settings::SettingsIndexService.new(@current_user)
      self
    end

    private

    def add_order_code
      @current_order.update(code: generate_order_code)
    end

    def generate_order_code
      Array.new(COUNT_OF_NUMBERS_IN_ORDER_CODE).map { rand(RANGE_OF_ORDER_CODE_NUMBERS) }
           .join.insert(0, FIRST_CODE_ORDER_SYMBOL)
    end
  end
end
