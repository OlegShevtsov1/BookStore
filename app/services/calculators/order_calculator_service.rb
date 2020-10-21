module Calculators
  class OrderCalculatorService
    attr_reader :order, :params, :book, :amount, :item

    def initialize(order:, params:)
      @order = order
      @params = params
      @book = Book.find(params[:book_id])
      @amount = book_calculator[:amount]
      @item = order.items.includes([:book]).find_by(book: book)
    end

    def call
      item_new_quantity
      order_calculator.merge(book_calculator)
    end

    private

    def book_calculator
      Calculators::BooksCalculatorService.new(book: book, params: params).call
    end

    def order_calculator
      { subtotal_price: order.decorate.subtotal_price, order_total_price: order.decorate.order_total_price }
    end

    def item_new_quantity
      item.update(quantity: amount)
    end
  end
end
