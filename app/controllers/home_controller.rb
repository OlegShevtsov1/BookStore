class HomeController < ApplicationController
  COUNT_LAST_BOOKS = 3
  def home
    @books_slider = Book.includes(:authors).last(COUNT_LAST_BOOKS)
    @books_presenter = BooksPresenter.new(params)
  end
end
