class OrdersController < ApplicationController
  def index
    @orders = Sort::SortOrdersService.new(Order.all, params['sort_by']).call
  end

  def show
    @order = Order.find(params[:id])
    @addresses = Settings::SettingsIndexService.new(current_user)
  end
end
