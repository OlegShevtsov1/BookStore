class BooksController < ApplicationController
  include Pagy::Backend
  BOOKS_COUNT_ROW = 4
  COUNT_PAGE_BOOKS = 12
  skip_before_action :verify_authenticity_token

  def index
    @pagy, @books = pagy(Sort::SortBooksService.new(books, params['sort_by']).call, items: COUNT_PAGE_BOOKS)
    authorize books
  end

  def show
    @comment = Comment.new
    authorize book
  end

  def calc_price
    respond_to do |format|
      format.json do
        render json: Calculators::BooksCalculatorService.new(book: book, params: params).call, status: :ok
      end
      format.html
    end
  end

  private

  def books
    return @books ||= Book.includes(%i[category]).all unless params[:category_id]

    @books ||= category.books
  end

  def book
    @book ||= books.find(params[:id]).decorate
  end

  def category
    @category ||= Category.find(params[:category_id])
  end
end
