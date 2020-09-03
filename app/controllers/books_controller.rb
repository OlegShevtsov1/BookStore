class BooksController < ApplicationController
  before_action :books, only: [:index]

  def index
    @books = Sort::SortBooksService.new(@books, params['sort_by']).call
    @categories = Category.all
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
