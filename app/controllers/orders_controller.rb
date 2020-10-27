class OrdersController < ApplicationController
  def index
    @orders = Sort::SortOrdersService.new(Order.all, params['sort_by']).call
  end
end
