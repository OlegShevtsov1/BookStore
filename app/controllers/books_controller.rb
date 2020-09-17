class BooksController < ApplicationController
  include Pagy::Backend
  COUNT_PAGE_BOOKS = 12
  skip_before_action :verify_authenticity_token
  before_action :books_presenter, only: %i[index show]
  before_action :books, only: [:index]
  before_action :book, only: [:show]

  def index
    @pagy, @books = pagy(Sort::SortBooksService.new(@books, params['sort_by']).call, items: COUNT_PAGE_BOOKS)
  end

  def show
    @book_presenter = BookPresenter.new(@book)
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
    return @books = @books_presenter.books unless params[:category_id]

    @books ||= category.books.includes(:authors)
  end

  def book
    @book = books.find(params[:id])
  end

  def category
    @category ||= Category.find(params[:category_id])
  end

  def books_presenter
    @books_presenter = BooksPresenter.new(params: params)
  end
end
