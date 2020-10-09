module Calculators
  class OrderCalculatorService
    attr_reader :params

    def initialize(params:)
      @params = params
    end

    def call
      Calculators::BooksCalculatorService.new(book: book, params: params).call
    end

    private

    def book
      Book.find(params[:book_id])
    end
  end
end
