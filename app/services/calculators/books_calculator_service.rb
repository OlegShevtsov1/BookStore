module Calculators
  class BooksCalculatorService
    attr_reader :book, :amount, :change

    def initialize(book:, params:)
      @book = book
      @amount = params[:amount]
      @change = params[:change]
    end

    def call
      { price: calc_price, amount: @amount }
    end

    private

    def calc_price
      format('%<offset>.2f', offset: book.price * calc_amount.to_i)
    end

    def calc_amount
      return 1 if amount.nil?
      return 1 if amount.to_i < 2 && change == 'minus'

      @amount = change == 'plus' ? amount.to_i + 1 : amount.to_i - 1
    end
  end
end
