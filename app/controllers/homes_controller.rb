class HomesController < ApplicationController
  COUNT_LAST_BOOKS = 3
  def index
    @books_slider = Book.includes(:authors).last(COUNT_LAST_BOOKS)
    @categories = Category.all
  end
end
