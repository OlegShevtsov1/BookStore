class ApplicationController < ActionController::Base
  DEFAULT_COUNT_ITEMS_IN_CART = 0
  before_action :categories, :count_items_in_cart

  def categories
    @categories = Category.all
  end

  def current_order
    Order.find_by(id: session[:current_order_id])
  end

  def count_items_in_cart
    @count_items_in_cart = current_order ? current_order&.items&.map(&:quantity)&.sum.to_i : DEFAULT_COUNT_ITEMS_IN_CART
  end
end
