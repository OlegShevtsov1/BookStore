class CartsController < ApplicationController
  def index
    @books = current_order&.books
    @current_order = current_order
  end
end
