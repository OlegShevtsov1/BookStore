class BooksController < ApplicationController
  COUNT_PAGE_BOOKS = 12
  before_action :books, only: [:index]

  def index
    @pagy, @books = pagy(Sort::SortBooksService.new(@books, params['sort_by']).call, items: COUNT_PAGE_BOOKS)
    @books_presenter = BooksPresenter.new(params: params)
  end

  private

  def books
    return @books = Book.all unless params[:category_id]

    @books ||= category.books
  end

  def category
    @category ||= Category.find(params[:category_id])
  end
end
