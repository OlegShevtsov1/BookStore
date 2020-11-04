module Checkout
  class CheckoutPaymentService
    attr_reader :params, :current_order, :credit_card

    def initialize(params, current_user, current_order)
      @params = params
      @current_user = current_user
      @current_order = current_order
    end

    def call
      @credit_card = CreditCardForm.new(credit_card_params)
      return unless @credit_card.valid?

      save_credit_card
      return_step
    end

    def show
      @credit_card = current_order.credit_card || CreditCardForm.new
      self
    end

    private

    def save_credit_card
      current_order.credit_card ? @credit_card.update : @credit_card.create
    end

    def credit_card_params
      params.require(:credit_card).permit(:name, :number, :date, :cvv, :order_id)
    end

    def return_step
      (@current_order.confirmation! if @current_order.may_confirmation?) || params[:step]
    end
  end
end
