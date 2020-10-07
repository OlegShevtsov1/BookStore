class CartsController < ApplicationController
  def index
    @items = current_order&.books
  end
end
