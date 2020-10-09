class CartsController < ApplicationController
  def index
    @books = current_order&.books&.includes([:category])
    @current_order = current_order
  end
end
